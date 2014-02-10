<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jcr:nodeProperty node="${currentNode}" name="text" var="text"/>

<c:if test="${renderContext.editMode}">
<template:addResources type="css" resources="esigate-tags.css"/>
<fieldset class="esigate esigateComment">
    <legend title="text : ${text.string}">ESI : comment</legend>
    <div class="innerEsi">
    	Commented text : ${text.string}
</c:if>

<esi:comment text="${text.string}" />

<c:if test="${renderContext.editMode}">
    </div>
</fieldset>
</c:if>
