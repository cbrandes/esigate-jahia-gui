package org.jahia.module.esigate;

import java.io.IOException;

import javax.jcr.PathNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jahia.bin.errors.ErrorHandler;
import org.jahia.services.render.URLResolver;
import org.jahia.services.render.URLResolverFactory;

/**
 * Classe permettant de rajouter un parametre de requete precisant la page d'origine, Jahia ayant l'habitude de
 * forwarder directement sur la page d'erreur correspondante
 */
public class EsigateErrorHandler implements ErrorHandler {
	/** The url resolver factory. */
	private URLResolverFactory urlResolverFactory;

	/**
	 * Sets the url resolver factory.
	 * 
	 * @param urlResolverFactory
	 *            the new url resolver factory
	 */
	public void setUrlResolverFactory(URLResolverFactory urlResolverFactory) {
		this.urlResolverFactory = urlResolverFactory;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.jahia.bin.errors.ErrorHandler#handle(java.lang.Throwable, javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public boolean handle(Throwable e, HttpServletRequest request, HttpServletResponse response) throws IOException,
			ServletException {
		if (!(e instanceof PathNotFoundException)) {
			return false;
		}
		URLResolver urlResolver = urlResolverFactory.createURLResolver(request.getPathInfo(), request.getServerName(),
				request);
		String originalPagePath = urlResolver.getPath();
		request.setAttribute("originalPagePath", originalPagePath);
		return false;
	}
}
