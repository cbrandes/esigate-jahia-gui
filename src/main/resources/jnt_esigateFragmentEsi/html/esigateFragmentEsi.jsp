<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jcr:nodeProperty node="${currentNode}" name="fragmentName" var="fragmentName"/>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateFragment">
    <legend title="fragmentName : ${fragmentName.string}"><fmt:message key="label.esigateFragment"/></legend>
    <div class="innerEsi">
</c:if>

<esi:fragment name="${fragmentName.string}">
    <template:area  path="${currentNode.name}" areaAsSubNode="true"/>
</esi:fragment>

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
