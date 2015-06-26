<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateInclude">
	<legend title="provider : ${currentNode.properties.provider.string} - src : ${currentNode.properties.src.string} - fragment : ${currentNode.properties.fragment.string}"><fmt:message key="label.esigateInclude"/></legend>
    <div class="innerEsi">
</c:if>

<c:set var="provider" value="" scope="request" />
<c:if test="${not empty currentNode.properties.provider}">
    <c:set var="provider" value="$(PROVIDER{${currentNode.properties.provider.string}})/" scope="request" />
</c:if>
<esi:include src="${provider}${currentNode.properties.src.string}"
    <c:if test="${not empty currentNode.properties.fragment}"> fragment="${currentNode.properties.fragment.string}"</c:if> 
    <c:if test="${not empty currentNode.properties.xpath}"> xpath="${currentNode.properties.xpath.string}"</c:if>
	<c:if test="${not empty currentNode.properties.continueOnError && currentNode.properties.continueOnError.boolean}"> onerror="continue"</c:if>>
    <template:area  path="${currentNode.name}" areaAsSubNode="true"/>
</esi:include>
<c:if test="${not empty currentNode.properties.styleSheet}">
    <template:addResources>
        <esi:include src="${provider}${currentNode.properties.src.string}" fragment="${currentNode.properties.styleSheet.string}" onerror="continue">
        </esi:include>
    </template:addResources>
</c:if>
<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
