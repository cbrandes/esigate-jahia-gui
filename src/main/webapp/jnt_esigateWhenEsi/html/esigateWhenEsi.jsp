<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jcr:nodeProperty node="${currentNode}" name="test" var="test"/>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateWhen">
    <legend title="test : ${test.string}"><fmt:message key="label.esigateChoose.whenBlock" /></legend>
    <div class="innerEsi">
</c:if>

<esi:when test="${test.string}">
	<template:area  path="${currentNode.name}" areaAsSubNode="true"/>
</esi:when>

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
