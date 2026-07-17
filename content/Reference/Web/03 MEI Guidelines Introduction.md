---
title: MEI Guidelines Introduction
source: https://music-encoding.org/guidelines/v4/content/introduction.html
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: MEI 악보 표현
description: MEI가 어떤 음악 문서 표현 프레임워크인지 설명하는 공식 가이드 본문.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - MEI
  - MusicXML
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# MEI Guidelines Introduction

- 원문: [MEI Guidelines Introduction](https://music-encoding.org/guidelines/v4/content/introduction.html)
- 관련 기능: MEI 악보 표현
- 선별 이유: MEI가 어떤 음악 문서 표현 프레임워크인지 설명하는 공식 가이드 본문.

## 원문 클리핑

## 1\. Introduction to MEI

Welcome to the MEI Guidelines. They provide documentation for the Music Encoding Initiative’s framework for describing music notation documents. This includes both a technical specification of the XML-based implementation of MEI and an explanatory description of its concepts.

The MEI Guidelines are intended to serve as a reference tool for music encoders. Through the use of natural-language definitions and examples, this documentation assists users of MEI in achieving effective and consistent markup. Despite translating XML and RNG terminology and concepts into more accessible language, it is still a technical one that presupposes a minimal understanding of XML and music notation. Novice encoders may want to start their MEI experience by doing an [introductory tutorial](https://music-encoding.org/resources/tutorials.html) first. These Guidelines will provide recommendations and arguments for encoding different types of music notation for a variety of purposes. While the specification of the framework is complete, the description is not necessarily complete. MEI is used in various contexts, and not every use-case may be fully reflected in these Guidelines. However, MEI is a community effort, so feedback and suggestions for improvement are highly welcome. Several starting points to get in touch with the MEI community can be found on the [MEI website](https://music-encoding.org/community/community-contacts.html).

These Guidelines make use of real-world examples to illustrate appropriate encoding concepts. We consider the use of such images as fair use. Contributors to these Guidelines are requested to given proper reference to the libraries holding the material used here. They’re also asked to be aware of potential copyright infringements and avoid respective material, or replace it with hand-drawn, made-up examples. If you find material that possibly offends copyright, please [get in touch](mailto:info@music-encoding.org) with us, and we will take it down.

### 1.1. About these Guidelines

#### 1.1.1. MEI Design Principles

This section of the Guidelines defines principles and criteria for designing, developing, and maintaining an XML-based encoding scheme for music notation documents.

##### Definitions and Parameters

A music notation document is one that contains music notation; that is, any one of a number of “visual analogues of musical sound, either as a record of sound heard or imagined, or as a set of visual instructions for performers.” (Ian D. Bent, et al. “Notation.” Grove Music Online. Oxford Music Online. 25 May 2010. [http://www.oxfordmusiconline.com/subscriber/article/grove/music/20114](http://www.oxfordmusiconline.com/subscriber/article/grove/music/20114).) However, MEI’s understanding is more inclusive than this restrictive definition, i.e. Braille certainly qualifies as music notation documents.

The encoding scheme permits both the creation of new music notation documents and the conversion of existing ones from print and other electronic formats. However, conversion of existing documents may require revisions in content or rearrangement of information.

##### General Principles

MEI may be used to encode both primary sources of music notation, such as an autograph or published score, and secondary sources, such as a scholarly edition based on one or more primary sources. The format encompasses both use cases, and the encoder must choose the elements and attributes most appropriate in each case. These Guidelines aim to provide guidance on that task.

As an encoded representation of one or more music notation documents, an MEI file may be employed as a surrogate for the original materials.

Although the encoding scheme does not define or prescribe intellectual content for music notation documents, it does define content designation and is intended to be used with available data content standards. MEI identifies the essential data elements within music notation documents and establishes codes and conventions necessary for capturing and distinguishing information within those elements for future action or manipulation. While there are a few elements that ought to appear in any MEI document, various intellectual, technical, and economic factors influence the level of detail of analysis and encoding actually undertaken. Taking this into consideration, the encoding scheme is designed with a minimum of required elements and allows for progressively more detailed levels of description as desired.

The encoding scheme preserves and enhances the current functionality of existing music notation documents. It permits identification of document structures and content that support description, navigation, analysis, and online and print presentation.

The encoding scheme is intended to facilitate interchange between notational tools. It aims to assist in the creation of more effective and consistent encoding, encourage the creation of cooperatively-created and widely available databases of music notation documents, and permit the reuse of encoded data for multiple output purposes. It will also ensure that machine-readable music notation documents will outlive changing hardware and software environments because they are based on a platform-independent standard.

##### Structural Features

The encoding scheme is based on eXtensible Markup Language (XML), a text-based format for representing structured information. It is expressed as a One Document Does-it-all (ODD) document. For more information on ODD, please refer to TEI Guidelines chapter 22: [Documentation Elements](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html), chapter 23: [Using the TEI](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/USE.html), and to the TEI’s “ [Getting Started with P5 ODDs](https://tei-c.org/guidelines/customization/getting-started-with-p5-odds/) ” document.

Related or complementary standards, such as the [Text Encoding Initiative (TEI) Guidelines for Electronic Text Encoding and Interchange](http://www.tei-c.org/Guidelines/P5/), [the Encoded Archival Description (EAD)](http://www.loc.gov/ead/), [MARC 21 Format for Bibliographic Data](http://www.loc.gov/marc/bibliographic/ecbdhome.html), existing notation encoding schemes, etc. have been consulted and employed as appropriate. For example, the data model includes a header that is comparable to the TEI header, and TEI and EAD naming conventions and tag structures have been used whenever feasible. However, while some feature names are similar, or even the same, it is important to recognize that MEI and TEI have different semantic scope. Obviously, a note element in MEI does not carry the same meaning as the element of the same name in TEI. Perhaps less obviously, a phrase in music notation is unrelated to a textual phrase.

With respect to metadata, MEI recognizes the close relationship between the metadata content found in the MEI header and that of catalog records, authority records, and finding aids. Therefore MEI provides ways of indicating in the encoding the corresponding fields of other metadata standards.

To ensure broad international and multi-repertoire application of MEI, existing musical terminology was used in building the data model where practical. When appropriate, a more neutral terminology was used to facilitate sharing of concepts and thus stressing the commonalities between different repertoires. Finally, extensive use of attributes and clearly-defined classification mechanisms in the schema permits the refinement of element meanings within specific musical, geographic, or temporal contexts.

##### Control and Maintenance

The Music Encoding Initiative Community has given itself [By-laws](https://music-encoding.org/community/mei-by-laws.html), which regulate all essential properties and procedures. The community elects a [Board](https://music-encoding.org/community/mei-board.html), which in turn governs and represents the community. The Board consists of nine elected members, with three seats standing for election for three year terms each year. Everyone registered to the [MEI-L](https://music-encoding.org/community/community-contacts.html) mailing list is eligible to vote for the Board.

In addition to the Board, there is a [Technical Team](https://music-encoding.org/community/technical-team.html), which is open for anyone interested to work on the maintenance and improvement of MEI itself. The Technical team will assist Interest Groups and other interested community members in an advisory capacity on how to further develop MEI for both existing and new fields of application.

#### 1.1.2. Acknowledgments

Many institutions and individuals assisted in the preparation of these Guidelines and in the overall development of the Music Encoding Initiative framework and community.

Grateful acknowledgment is given to the following institutions for their generous contributions: the Akademie der Wissenschaften und der Literatur (AdW) in Mainz for serving as hosting institution for the MEI Community, and the National Endowment for the Humanities (NEH) and the Deutsche Forschungsgemeinschaft (DFG) for their joint financial support of the MEI project in its early stages. We thank several institutions that hosted Music Encoding Conferences or other MEI-related meetings in the past: The AdW Mainz, the University of Virginia Library, the Biblioteca Umanistica of the Università degli Studi Firenze, McGill University Montréal, the Centre d’études supérieures de la Renaissance Tours, the Maryland Institute for Technology in the Humanities (MITH) in College Park, the Oxford e-Research Centre, the Universität Paderborn and the Österreichische Akademie der Wissenschaften Wien in conjunction with the Universität Wien and the Mozarteum Salzburg. We also thank all other institutions that allow their researchers to invest time into both the community and the encoding framework. It is their interest that makes MEI an incredible platform for interchange and scholarly progress.

The Text Encoding Initiative is also owed a special debt of gratitude. In addition to providing much of the inspiration for MEI, the TEI organization supplied funding for the MEI Technical Group in its efforts to adopt ODD. The editors of these Guidelines are grateful for those of the TEI, which provided a stellar exemplar and from which we have borrowed shamelessly.

MEI has been a community-driven effort for more than a decade, and many individuals have provided significant and much-appreciated commitments of time and energy to the development of MEI: Nikolaos Beer; Vincent Besson; Benjamin W. Bohl; Margrethe Bue; Donald Byrd; Irmlind Capelle; Tim Crawford; David A. Day; Giuliano Di Bacco; Norbert Dubowy; Richard Freedman; Ichiro Fujinaga; Andrew Hankinson; Maja Hartwig; Kristin Herold; Franz Kelnreiter; Johannes Kepper; Robert Klugseder; Zoltán Kömíves; David Lewis; Urs Liska; Elsa De Luca; Erin Mayhood; Stefan Morent; Stefan Münnich; Markus Neuwirth; Kevin Page; Daniel Pitti; Laurent Pugin; Klaus Rettinghaus; Kristina Richts; Daniel Röwenstrunk; Perry Roland; Craig Sapp; Agnes Seipelt; Eleanor Selfridge-Field; Christine Siegert; Peter Stadler; Axel Teich Geertinger; Martha Thomae; Joachim Veit; Raffaele Viglianti; Thomas Weber; and Sonia Wronkowska.

Thanks to Bernhard R. Appel; Richard Chesser; Morgan Cundiff; J. Stephen Downie; Oliver Huck; Fotis Jannidis; John Rink; Federica Riva; Frans Wiering and Barbara Wiermann for providing expertise on a wide range of topics related to music notation modelling.

Also thanks to Syd Bauman, Terry Catapano, and Sebastian Rahtz for their invaluable problem-solving assistance during the development of the 2010 RNG schema. Thanks to Sebastian Rahtz and James Cummings of the Text Encoding Initiative (TEI) for their help with making ODD work with MEI, their assistance in more closely aligning MEI and TEI, and their quick responses to questions and Roma bug reports.

Finally, the members of the Music Encoding Initiative would like to thank Perry Roland for his foresight, engagement and dedication in laying the foundations of this initiative.

### 1.2. Basic Concepts of MEI

#### 1.2.1. Musical Domains

The term “music” has many different notions, ranging from audible sounds over written performance instructions or transcriptions of such events to conceptual rulesets that establish different theories of what music is, and what is allowed in music. In 1965, Milton Babbitt distinguished between *graphemic*, *acoustic* and *auditory* aspects of music (Babbitt, Milton: *The Use of Computers in Musicological Research*, in: *Perspectives of New Music* 3/2 (1965), p. 76).

Various music encoding formats took up this distinction, most notably SMDL, the *Standard Music Description Language* (ISO/IEC DIS 10743). While the format itself was hardly ever used for its impractical implementation details, parts of its design certainly influenced the development of other formats, including MEI. In a documentation draft ([http://xml.coverpages.org/smdl10743-pdf.gz, p.5](http://xml.coverpages.org/smdl10743-pdf.gz)), SMDL identifies four different *musical domains*:

logical domain

The logical domain is the basic musical content – the essence from which all performances and editions of the work are derived, including virtual time values, nominal pitches, etc. The logical domain is describable as “the composer’s intentions with respect to pitches, rhythms, harmonies, dynamics, tempi, articulations, accents, etc.,” and it is the primary focus of SMDL. It can also be described as “the abstract information common to both the gestural and visual domains.” \[…\]

gestural domain

The gestural domain is comprised of any number of performances, each of which may specify how and when components of the logical domain is rendered in a specific performance, including all the means whereby the performer actually “expresses” (acoustically instantiates) the music (intonation, agogic and dynamic stress, etc.). The gestural domain is perhaps most succinctly described as “the information added by performers,” or “how the music actually sounds during particular performances.” \[…\]

visual domain

The visual domain is comprised of any number of scores, each of which somehow specifies exactly how components of the logical domain is rendered visually in some particular printable (and/or displayable) edition, including such graphical details as symbology, symbol sets, fonts, page layout, beaming conventions and exceptions, etc. The visual domain is perhaps most succinctly described as “the information added by human editors, engravers, and typesetters,” or “how the music actually looks in some particular edition.” \[…\]

analytical domain

The analytical domain is comprised of any number of theoretical analyses and/or commentaries, each of which somehow specifies opinions, exegeses, etc. about any or all of the information in the other three domains. \[…\]

On a generic level, MEI follows the same definition, and it definitely shares the same terminology. However, not all four domains are available throughout the MEI schema, and quite frequently, two domains fall together in MEI. Very often, *MEI prioritizes the visual domain over the gestural domain* by (partly) *conflating the logical and the visual domains*. For example, MEI utilizes the `@pname` (pitch name) attribute on notes to capture the *written* pitch of a note, whereas the sounding pitch may be described with the `@pname.ges` attribute. Here, the logical and visual domains go without a special indication, whereas the gestural domain is identified by a special suffix. However, in case of transposing instruments, additional markup (namely the attributes `@trans.diat` and `@trans.semi` from MEI’s attribute class [att.staffDef.log](https://music-encoding.org/guidelines/v4/attribute-classes/att.staffdef.log.html)) will create a distinction between the logical and visual domain (see chapter [Defining Score Parameters for CMN](https://music-encoding.org/guidelines/v4/content/cmn.html#cmnDefs)). In that case, `@pname` will be restricted to the visual domain, while the logical aforementioned attributes provide additional information for the logical domain.

Even though the technical implementation of MEI prioritizes the visual domain to some degree, this does not mean that any given encoding has to provide visual information. MEI takes no assumption on what data is required: While an OMR project (*optical music recognition*) may generate strictly visually oriented data only, another project focussed on audio transcriptions may generate gestural data only. A third project could integrate both approaches.

In order to avoid ambiguous encodings, MEI is very strict and specific on the scope of its individual markup elements. For an encoder, the suffixes mentioned above provide clear hints on which domain is addressed by specific markup: Many attributes carry a suffixed *.log* (logical), *.ges* (gestural), *.vis* (visual), or *.anl* (analytical) in their name. In addition, the internal structure of MEI heavily relies on those different domains. When customizing MEI (see chapter [Customizing MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#meicustomization)), it is possible to turn off either visual or gestural domain encoding completely. That way, MEI allows to address the four most eminent musical domains specifically and independent of each other.

#### 1.2.2. Events and Controlevents

MEI differentiates between two essential aspects of music notation: *Events* and *ControlEvents*. There are other examples for such a separation of concerns with regard to music. In Greg’s Copy-Text Theory (W.W.Greg: *The Rationale of Copy-Text*, 1950), a distinction between primary and secondary text is made; similar attempts have been made for music specifically.

In MEI, elements describing the basic musical text are referred to as *Events*. They are the building blocks for the stream of music – mostly those are [note](https://music-encoding.org/guidelines/v4/elements/note.html) s, [rest](https://music-encoding.org/guidelines/v4/elements/rest.html) s, and [chord](https://music-encoding.org/guidelines/v4/elements/chord.html) s. In contrast, *ControlEvents* make no independent contribution to that flow of music. Instead, they provide additional information about the encoded *Events*, they *control* their performance. Examples for such *ControlEvents* are [dynam](https://music-encoding.org/guidelines/v4/elements/dynam.html) ic markings, [tempo](https://music-encoding.org/guidelines/v4/elements/tempo.html) s indications, or performance [dir](https://music-encoding.org/guidelines/v4/elements/dir.html) ectives. Depending on the encoding strategy used, [slur](https://music-encoding.org/guidelines/v4/elements/slur.html) s and [tie](https://music-encoding.org/guidelines/v4/elements/tie.html) s often also fall into this category (they may be encoded as attributes instead, in which case they become a property of the basic events). Simply put, *Events* describe ***what*** needs to be performed, and *ControlEvents* indicate ***how*** it needs to be performed. In ( [Repertoire: Common Music Notation](https://music-encoding.org/guidelines/v4/content/cmn.html) -based) MEI, *Events* are nested inside a [layer](https://music-encoding.org/guidelines/v4/elements/layer.html) element, while *ControlEvents* are direct children of the first [measure](https://music-encoding.org/guidelines/v4/elements/measure.html) they apply to, following all [staff](https://music-encoding.org/guidelines/v4/elements/staff.html) elements there. These structural differences result in different markup concepts. As *Events* are encoded inside [layer](https://music-encoding.org/guidelines/v4/elements/layer.html) s, their *semantic position* inside the encoded work can be derived from their *structural position* – the measure, staff and layer they’re nested in, and within that layer by their position inside the sequence of all layer children. As mentioned above, it is highly *recommended* to encode *ControlEvents* inside the first measure they apply to, but they still require references to the actual events they apply to. There are two common concepts to provide such a connection, both of which offering specific benefits and drawbacks. A technically very stable connection between *ControlEvents* and *Events* can be established by using **pointers**. In this case, all events that need to be referenced need an *@xml:id* attribute, which holds a globally unique identifier for this very element. The referencing controlevent then uses a *@startid* and, if necessary, *@endid* attribute to create a link to where in the stream of music it is supposed to start or end.

```xml
<measure n="10">
  <staff n="1">
    <layer>
      <note pname="f" oct="4" dur="4"/>
      <note pname="g" oct="4" dur="4" xml:id="c4ded06ff"/>
      <note pname="a" oct="4" dur="4"/>
      <note pname="c" oct="5" dur="4"/>
    </layer>
  </staff>
  <dynam startid="#c4ded06ff">f</dynam>
</measure>
```

In the example above, the [dynam](https://music-encoding.org/guidelines/v4/elements/dynam.html) element references the second quarter in the given measure. Additional attributes like *@place* may be used to describe the position of the *forte* indication within the score. A [hairpin](https://music-encoding.org/guidelines/v4/elements/hairpin.html) element may use the *@endid* attribute to indicate the duration of the hairpin using the same mechanism as above.

[@startid](https://music-encoding.org/guidelines/v4/attribute-classes/att.startid.html)

Holds a reference to the first element in a sequence of events to which the feature applies.

[@endid](https://music-encoding.org/guidelines/v4/attribute-classes/att.startendid.html)

Indicates the final element in a sequence of events to which the feature applies.

A *ControlEvent* encoded like above will be strictly tied to the referenced *Events* – if their position inside the XML document changes for whatever reason, they will keep that connection. This means that the *semantic position* to which they are bound may change without affecting the binding. An example could be an inserted additional note in front – the dynamic marking would not start on the second quarter, but perhaps on the third instead.

As this behavior may not be desired in all cases, an alternative binding between *ControlEvents* and *Events* is possible, relying on *timestamps* instead. This mechanism is illustrated in the following example:

```xml
<measure n="10">
  <staff n="1">
    <layer n="1">
      <note pname="f" oct="4" dur="4"/>
      <note pname="g" oct="4" dur="4"/>
      <note pname="a" oct="4" dur="4"/>
      <note pname="c" oct="5" dur="4"/>
    </layer>
  </staff>
  <dynam staff="1" layer="1" tstamp="2">f</dynam>
</measure>
```

Here, no *@xml:id* is required on notes. Instead, the [dynam](https://music-encoding.org/guidelines/v4/elements/dynam.html) element uses the *@staff* and *@layer* attributes to indicate to which set of events the following *@tstamp* attribute refers to.

[@tstamp](https://music-encoding.org/guidelines/v4/attribute-classes/att.timestamp.logical.html)

Encodes the onset time in terms of musical time, i.e., beats\[.fractional beat part\], as expressed in the written time signature.

This mechanism actually depends on what has been only recommended above: placing the controlevent inside the measure where it starts. The *@startid* reference mechanism would work equally well if all controlevents where positioned in the very first or last measure, or actually even inside a separate file. The *@tstamp* references however would not, they depend on correct placement of the controlevents inside the XML tree. For consistency, it is therefore *recommended* to always use this placement.

The benefit of this concept is that controlevents are tied to a *semantic position*, but not necessarily to a given XML element. The *forte* may still be placed on the second quarter, even though the composer may have replaced that quarter G4 with a different pitch and / or duration. Actually, it is not required that an *Event* can be found at the position indicated by a timestamp. This may be useful to encode a slur ending at an arbitrary position between two events, or dynam markings spread across otherwise empty measures.

If the ending of a *ControlEvent* shall be given by timestamp, the *@tstamp2* attribute is used.

[@tstamp2](https://music-encoding.org/guidelines/v4/attribute-classes/att.timestamp2.logical.html)

Encodes the ending point of an event, i.e., a count of measures plus a beat location in the ending measure.

Because of potential inconsistencies, an encoding should not offer both *@startid* and *tstamp* or *@endid* and *@tstamp2*. Though not being recommendable, it is possible to mix *@startid* with *@tstamp2* and *@tstamp* with *@endid*. In general, it is easier for software to process *@startid* and *@endid*. When no other arguments apply, using *@xml:id* -based pointers is therefore the most common way to connect *ControlEvents* with *Events*.

The details on how timestamps are calculated and used in MEI are given in [Timestamps in MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#timestamps).

#### 1.2.3. Timestamps in MEI

In MEI, timestamps are treated in a slightly simplified way: they have no notion of *beat*. Instead, timestamps rely solely on the numbers given in the meter signature. In a measure of 4/4, timestamps will range from 1 to 4. The second eighth note will be 1.5 in this case. If the same measure would be given in 2/2, it would be 1.25 instead.

[@tstamp](https://music-encoding.org/guidelines/v4/attribute-classes/att.timestamp.logical.html)

Encodes the onset time in terms of musical time, i.e., beats\[.fractional beat part\], as expressed in the written time signature.

At this point, MEI uses real numbers only to express timestamps. In case of (nested or complex) tuplets, this solution is inferior to fractions because of rounding errors. It is envisioned to introduce a fraction-based value for timestamps in a future revision of MEI. For now, it is recommended to round the fractional part of the number to no more than five digits to avoid such problems.

Durations may also be expressed based on timestamps. In this case, the values are a combination of the *count of measures* that need to be moved forward to reach the measure in which an encoded feature ends, and the *timestamp* within that measure.

[@tstamp2](https://music-encoding.org/guidelines/v4/attribute-classes/att.timestamp2.logical.html)

Encodes the ending point of an event, i.e., a count of measures plus a beat location in the ending measure.

The following example contains a number of [slur](https://music-encoding.org/guidelines/v4/elements/slur.html) examples illustrating durations expressed by timestamps.

```xml
<!-- slur starting on timestamp 1, ending on timestamp 4 of the same measure -->
<slur tstamp="1" tstamp2="0m+4"/>

<!-- slur ending on timestamp 1 of the following measure -->
<slur tstamp="1" tstamp2="1m+1"/>

<!-- slur ending on timestamp 2.5 in the second next measure -->
<slur tstamp="1" tstamp2="2m+2.5"/>
```

Sometimes, timestamps are used to indicate positions where no music *Events* are located (see [Events and Controlevents](https://music-encoding.org/guidelines/v4/content/introduction.html#eventsControlevents)). Therefore, the allowed range of timestamps stretches from 0 to the current meter count + 1. By definition, a timestamp of 1 indicates the position of the left barline, while a timestamp of 5 (in case of a 4/4 meter) indicates the right barline. This makes it possible to encode open-ended slurs in a graphical way. However, it should be kept in mind that such timestamps may not be converted to *@startid* and *@endid*, and not every application may be able to render them correctly, even though they are perfectly valid MEI, and sometimes are necessary to faithfully transcribe a source.

#### 1.2.4. MEI Profiles

MEI is an encoding framework, not a data format. This means that MEI provides recommendations for encoding music documents, but it depends on the encoder’s needs and requirements to which features and solutions are appropriate to the task and should to be used. MEI offers specific models for different notation types and music repertoires, but it is rarely advisable to use them all side by side in one encoding.

In order to use MEI, it is advised to use a restricted version of the schema, which will make it easier both for an encoder and a reader of the encoded files. MEI provides a number of pre-defined *profiles*, which focus on specific uses of MEI while still maintaining a great level of flexibility. For projects that need even better control over their data, it is highly recommended to create a more specific customized version of MEI (see chapter [Customizing MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#meicustomization)). The following customizations are provided with every release of MEI:

mei-CMN

For most users, this will be the best starting point into music encoding with MEI. The *mei-CMN* customization targets at documents that use *Common Western Music Notation*. The specific rules for that notation are specified in chapter [Repertoire: Common Music Notation](https://music-encoding.org/guidelines/v4/content/cmn.html), even though other chapters of these Guidelines apply as well.

mei-Mensural

For documents written in *Mensural Notation* (both black and white), MEI offers the *mei-Mensural* customization. The specific rules for that notation are specified in chapter [Repertoire: Mensural Notation](https://music-encoding.org/guidelines/v4/content/mensural.html), even though other chapters of these Guidelines apply as well.

mei-Neumes

This profile allows to encode medieval *Neume Notation* with MEI. The specific rules for that notation are specified in chapter [Repertoire: Neume Notation](https://music-encoding.org/guidelines/v4/content/neumes.html), even though other chapters of these Guidelines apply as well. Please note that the *mei-Neumes* profile has undergone significant changes from MEI version 3 to version 4.

mei-all

This is the full definition of MEI. It includes all different repertoires, which has certain side effects and enables encoding options that are neither intended nor advocable. For example, in mensural notation music is organized by staves. In contrast, Common Music Notation utilizes measures, which in turn contain staves. These staves have a different meaning here, and are modeled differently in MEI. *mei-all* mixes those models and thus invites encoding errors. In general, you should almost never use *mei-all* except for testing purposes.

mei-all\_anyStart

This profile includes all of *mei-all*, but extends it even further so that it allows any MEI element as root of conforming MEI instances. In regular MEI, the only allowed starting elements are [mei](https://music-encoding.org/guidelines/v4/elements/mei.html), [meiHead](https://music-encoding.org/guidelines/v4/elements/meihead.html), [music](https://music-encoding.org/guidelines/v4/elements/music.html) and [meiCorpus](https://music-encoding.org/guidelines/v4/elements/meicorpus.html). The sole purpose of this customization is to simplify validation at tutorial sessions and other educational purposes. It should not be used in production.

The first three profiles provide good starting points to encode music from the respective repertoires. They may also serve as template for further, project-specific customizations. The latter two profiles are targetting very specific use cases and should not be used by default.

#### 1.2.5. Customizing MEI

In production, it is best to use a customized version of MEI, restricted to the very needs of a project. Such a custom schema will guide the encoders and will help to ensure consistency and data quality throughout a project’s files. A customization typically provides a subset of MEI’s encoding models (typically starting from one of the official *profiles* mentioned in chapter [MEI Profiles](https://music-encoding.org/guidelines/v4/content/introduction.html#meiprofiles)), with only one solution for any given situation being allowed. The customization will help to reflect the scope of a project into its data: Only those aspects of music notation a project is interested in will be allowed, so that the absence of a specific information can not be misunderstood as an oversight of the encoders. Larger editorial projects like *Complete Works* editions typically use *Editorial Guidelines* (german: *Editionsrichtlinien*) for the same purposes: (internal) quality control and (external) documentation. In that sense, MEI customizations may serve as Editorial Guidelines in digital form.

MEI is implemented in ODD. ODD, or *One Document Does-it-all*, is another XML-based markup language developed and maintained by the TEI. TEI’s documentation for ODD can be found in the TEI Guidelines chapter 22: [Documentation Elements](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html), chapter 23: [Using the TEI](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/USE.html), and the “ [Getting Started with P5 ODDs](https://tei-c.org/guidelines/customization/getting-started-with-p5-odds/) ” document.

At this point, there is no specific documentation on how to customize MEI with ODD beyond the generic TEI documentation. However, the provided [MEI Profiles](https://music-encoding.org/guidelines/v4/content/introduction.html#meiprofiles) are based on ODD customizations, and may serve as starting point for further project-specific restrictions. They can be found at [https://github.com/music-encoding/music-encoding/tree/develop/customizations](https://github.com/music-encoding/music-encoding/tree/develop/customizations). In addition, several projects have shared their customizations on GitHub, such as [Freischütz Digital](https://github.com/Freischuetz-Digital/data-music/tree/master/schemata/odd) or [Beethovens Werkstatt](https://github.com/BeethovensWerkstatt/module2/tree/dev/data/odd).

MEI provides a webservice at [http://custom.music-encoding.org](http://custom.music-encoding.org/) which allows to compile such customizations against the MEI sources in order to generate RelaxNG schemata, which can be used for validation. More documentation on customizing MEI will be provided as time permits; until then, it is recommended to [reach out to the MEI Community](https://music-encoding.org/community/community-contacts.html) for additional assistance.

### 1.3. Sample Encodings and Tools for MEI

The Music Encoding Initiative provides a collection of sample encodings, which demonstrate a wide-range of uses of MEI in real-world contexts. They are available from [https://github.com/music-encoding/sample-encodings](https://github.com/music-encoding/sample-encodings).

For MEI, there is also a number of tools, which facilitate encoding of and working with MEI instances in various contexts. These tools are available from the [https://music-encoding.org/resources/tools.html](https://music-encoding.org/resources/tools.html) website.

[1.1. About these Guidelines](https://music-encoding.org/guidelines/v4/content/introduction.html#about) [1.1.1. MEI Design Principles](https://music-encoding.org/guidelines/v4/content/introduction.html#designprinciples) [1.1.2. Acknowledgments](https://music-encoding.org/guidelines/v4/content/introduction.html#acknowledgments) [1.2. Basic Concepts of MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#basicConcepts) [1.2.1. Musical Domains](https://music-encoding.org/guidelines/v4/content/introduction.html#musicalDomains) [1.2.2. Events and Controlevents](https://music-encoding.org/guidelines/v4/content/introduction.html#eventsControlevents) [1.2.3. Timestamps in MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#timestamps) [1.2.4. MEI Profiles](https://music-encoding.org/guidelines/v4/content/introduction.html#meiprofiles) [1.2.5. Customizing MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#meicustomization) [1.3. Sample Encodings and Tools for MEI](https://music-encoding.org/guidelines/v4/content/introduction.html#samplesTools)
