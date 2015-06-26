<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateAttempt">
    <legend><fmt:message key="label.esigateTry.attemptBlock" /> </legend>
    <div class="innerEsi">
</c:if>
<esi:attempt>
	<template:area  path="${currentNode.name}" areaAsSubNode="true"/>
</esi:attempt>
<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
