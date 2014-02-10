package org.gullcompany.esigate;

import org.apache.commons.lang.StringUtils;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;

/**
 * Filtre permettant d'utiliser un template distant pour habiller la page.
 * 
 * Si un parametre de request "originalPagePath" est present, on va tenter d'utiliser l'url correspondante pour remplacer la page.
 * Sinon, si une source est precisee, cette page servira de template au sens esi
 * 
 * Si aucun des deux cas n'est present, on ne change rien
 * 
 * 
 */
public class TemplateFilter extends AbstractFilter {

	/* (non-Javadoc)
	 * @see org.jahia.services.render.filter.AbstractFilter#execute(java.lang.String, org.jahia.services.render.RenderContext, org.jahia.services.render.Resource, org.jahia.services.render.filter.RenderChain)
	 */
	@Override
	public String execute(String previousOut, RenderContext renderContext,
			Resource resource, RenderChain chain) throws Exception {
		JCRNodeWrapper node = resource.getNode();
		if (node.isNodeType("smix:esigateTemplatePage")
				&& node.getProperty("doExecute").getBoolean()) {
			String originalPageURL=renderContext.getRequest().getParameter("originalPagePath");
			String cachedRenderContent;
			if(StringUtils.isNotBlank(originalPageURL)){
				StringBuilder builder = new StringBuilder();
				builder.append("<esi:include src=\"");
				String provider = node.getPropertyAsString("provider");
				if (StringUtils.isNotBlank(provider)) {
					builder.append("$(PROVIDER{");
					builder.append(provider);
					builder.append("})");
					if (!StringUtils.startsWith(originalPageURL, "/")) {
						builder.append("/");
					}
				}
				
				builder.append(originalPageURL);
				builder.append("\">");
				builder.append(previousOut);
				builder.append("</esi:include>");
				cachedRenderContent = builder.toString();
			}
			else if(node.hasProperty("src")){
				StringBuilder builder = new StringBuilder();
				builder.append("<esi:include src=\"");
				String src = node.getPropertyAsString("src");
				if (node.hasProperty("provider")) {
					String provider = node.getPropertyAsString("provider");
					if (StringUtils.isNotBlank(provider)) {
						builder.append("$(PROVIDER{");
						builder.append(provider);
						builder.append("})");
					}
					if (!StringUtils.startsWith(src, "/")) {
						builder.append("/");
					}
				}
				builder.append(src);
				builder.append("\">");
				builder.append(previousOut);
				builder.append("</esi:include>");
				cachedRenderContent = builder.toString();
			} else {
				//Pas de page d'origine ni de src, on ne change rien
				cachedRenderContent = previousOut;
			}
			
			return cachedRenderContent;
		}
		return previousOut;
	}

}
