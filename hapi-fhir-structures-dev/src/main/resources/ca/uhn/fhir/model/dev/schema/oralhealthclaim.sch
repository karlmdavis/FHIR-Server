<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="a" uri="http://www.w3.org/2005/Atom"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <sch:pattern>
    <sch:title>OralHealthClaim</sch:title>
    <sch:rule context="/f:DomainResource">
      <sch:assert test="exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))])">Inv-3: If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource</sch:assert>
      <sch:assert test="not(parent::f:contained and f:contained)">Inv-2: If the resource is contained in another resource, it SHALL not contain nested Resources</sch:assert>
      <sch:assert test="not(parent::f:contained and f:text)">Inv-1: If the resource is contained in another resource, it SHALL not contain any narrative</sch:assert>
    </sch:rule>
    <sch:rule context="/f:DomainResource/f:text/f:div">
      <sch:assert test="not(descendant-or-self::*/@*[not(name(.)=('abbr', 'accesskey', 'align', 'alt', 'axis', 'bgcolor', 'border', 'cellhalign', 'cellpadding', 'cellspacing', 'cellvalign', 'char', 'charoff', 'charset', 'cite', 'class', 'colspan', 'compact', 'coords', 'dir', 'frame', 'headers', 'height', 'href', 'hreflang', 'hspace', 'id', 'lang', 'longdesc', 'name', 'nowrap', 'rel', 'rev', 'rowspan', 'rules', 'scope', 'shape', 'span', 'src', 'start', 'style', 'summary', 'tabindex', 'title', 'type', 'valign', 'value', 'vspace', 'width'))])">Inv-3: The narrative SHALL contain only the basic html formatting attributes described in chapters 7-11 (except section 4 of chapter 9) and 15 of the HTML 4.0 standard, &lt;a&gt; elements (either name or href), images and internally contained style attributes</sch:assert>
      <sch:assert test="descendant::text()[normalize-space(.)!=''] or descendant::h:img[@src]">Inv-2: The narrative SHALL have some non-whitespace content</sch:assert>
      <sch:assert test="not(descendant-or-self::*[not(local-name(.)=('a', 'abbr', 'acronym', 'b', 'big', 'blockquote', 'br', 'caption', 'cite', 'code', 'colgroup', 'dd', 'dfn', 'div', 'dl', 'dt', 'em', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'hr', 'i', 'img', 'li', 'ol', 'p', 'pre', 'q', 'samp', 'small', 'span', 'strong', 'table', 'tbody', 'td', 'tfoot', 'th', 'thead', 'tr', 'tt', 'ul', 'var'))])">Inv-1: The narrative SHALL contain only the basic html formatting elements described in chapters 7-11 (except section 4 of chapter 9) and 15 of the HTML 4.0 standard, &lt;a&gt; elements (either name or href), images and internally contained style attributes</sch:assert>
    </sch:rule>
    <sch:rule context="/f:DomainResource/f:contained/f:meta/f:security">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:DomainResource/f:contained/f:meta/f:security/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:DomainResource/f:contained/f:meta/f:tag">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:DomainResource/f:contained/f:meta/f:tag/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:identifier/f:period">
      <sch:assert test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">Inv-1: If present, start SHALL have a lower value than end</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:identifier/f:assigner">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:ruleset">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:ruleset/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:originalRuleset">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:originalRuleset/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:target">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:provider">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:organization">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:priority">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:priority/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:fundsReserve">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:fundsReserve/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:enterer">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:facility">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:payee/f:type">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:payee/f:type/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:payee/f:provider">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:payee/f:organization">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:payee/f:person">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:referral">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:diagnosis/f:diagnosis">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:diagnosis/f:diagnosis/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:condition">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:condition/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:patient">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:coverage/f:coverage">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:coverage/f:relationship">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:coverage/f:relationship/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:coverage/f:claimResponse">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:coverage/f:originalRuleset">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:coverage/f:originalRuleset/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:exception">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:exception/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:accidentType">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:accidentType/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:interventionException">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:interventionException/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:missingteeth/f:tooth">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:missingteeth/f:tooth/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:missingteeth/f:reason">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:missingteeth/f:reason/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:orthoPlan/f:examFee">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:orthoPlan/f:diagnosticFee">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:orthoPlan/f:initialPayment">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:orthoPlan/f:periodicPayment">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:type">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:type/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:provider">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:service">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:service/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:quantity">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:unitPrice">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:net">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:udi">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:udi/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:bodySite">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:bodySite/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:subsite">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:subsite/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:modifier">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:modifier/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:type">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:type/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:service">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:service/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:quantity">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:unitPrice">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:net">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:udi">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:udi/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:type">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:type/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:service">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:service/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:quantity">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:unitPrice">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:net">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:udi">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:detail/f:subDetail/f:udi/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:prosthesis/f:priorMaterial">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:item/f:prosthesis/f:priorMaterial/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:additionalMaterials">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:OralHealthClaim/f:additionalMaterials/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
