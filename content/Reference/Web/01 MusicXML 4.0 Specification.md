---
title: MusicXML 4.0 Specification
source: https://www.w3.org/2021/06/musicxml40/
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: 악보 표준 포맷
description: MusicXML의 목적, 지위, 참조 문서와 튜토리얼 진입점이 있는 공식 스펙 페이지.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - MusicXML
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# MusicXML 4.0 Specification

- 원문: [MusicXML 4.0 Specification](https://www.w3.org/2021/06/musicxml40/)
- 관련 기능: 악보 표준 포맷
- 선별 이유: MusicXML의 목적, 지위, 참조 문서와 튜토리얼 진입점이 있는 공식 스펙 페이지.

## 원문 클리핑

## MusicXML

## Version 4.0

**Latest editor's draft:**

- [https://w3c.github.io/musicxml/](https://w3c.github.io/musicxml/)

**Editor:**

- [Michael Good](https://michaelgood.info/), [MakeMusic](https://www.makemusic.com/)

**Participate:**

- [GitHub w3c/musicxml](https://github.com/w3c/musicxml)
- [File a bug](https://github.com/w3c/musicxml/issues)
- [Commit history](https://github.com/w3c/musicxml/commits/gh-pages)

Copyright © 2004-2021 the Contributors to the MusicXML Specification, published by the [Music Notation Community Group](https://www.w3.org/community/music-notation/) under the [W3C Community Final Specification Agreement (FSA)](https://www.w3.org/community/about/agreements/final/). A human-readable [summary](https://www.w3.org/community/about/agreements/fsa-deed/) is available.

---

## Abstract

MusicXML is a standard open format for exchanging digital sheet music. It is designed for sharing sheet music files between applications, and for archiving sheet music files for use in the future. As of this publication date it is supported by over 250 applications.

## Status of this document

This specification was published by the [W3C Music Notation Community Group](https://www.w3.org/community/music-notation/). It is not a W3C Standard nor is it on the W3C Standards Track. Please note that under the [W3C Community Final Specification Agreement (FSA)](https://www.w3.org/community/about/agreements/final/) other conditions apply. Learn more about [W3C Community and Business Groups](https://www.w3.org/community/).

If you wish to make comments regarding this document, please send them to [public-music-notation-contrib@w3.org](mailto:public-music-notation-contrib@w3.org) ([subscribe](mailto:public-music-notation-contrib-request@w3.org?subject=subscribe), [archives](https://lists.w3.org/Archives/Public/public-music-notation-contrib/)).

## Reference

- [MusicXML reference](https://www.w3.org/2021/06/musicxml40/musicxml-reference/)
- [Container reference](https://www.w3.org/2021/06/musicxml40/container-reference/)
- [Opus reference](https://www.w3.org/2021/06/musicxml40/opus-reference/)
- [Sounds reference](https://www.w3.org/2021/06/musicxml40/sounds-reference/)

## Additional Information

- **Tutorial**
	- [Introduction](https://www.w3.org/2021/06/musicxml40/tutorial/introduction/)
		- ["Hello World" in MusicXML](https://www.w3.org/2021/06/musicxml40/tutorial/hello-world/)
		- [The Structure of MusicXML Files](https://www.w3.org/2021/06/musicxml40/tutorial/structure-of-musicxml-files/)
		- [The MIDI-Compatible Part of MusicXML](https://www.w3.org/2021/06/musicxml40/tutorial/midi-compatible-part/)
		- [Notation Basics in MusicXML](https://www.w3.org/2021/06/musicxml40/tutorial/notation-basics/)
		- [Chord Symbols and Diagrams](https://www.w3.org/2021/06/musicxml40/tutorial/chord-symbols-and-diagrams/)
		- [Tablature](https://www.w3.org/2021/06/musicxml40/tutorial/tablature/)
		- [Percussion](https://www.w3.org/2021/06/musicxml40/tutorial/percussion/)
		- [Compressed.MXL Files](https://www.w3.org/2021/06/musicxml40/tutorial/compressed-mxl-files/)
		- [Code Generation](https://www.w3.org/2021/06/musicxml40/tutorial/code-generation/)
- **File Listings**
	- [Overview](https://www.w3.org/2021/06/musicxml40/listings/overview/)
		- [musicxml.xsd](https://www.w3.org/2021/06/musicxml40/listings/musicxml.xsd/)
		- [xlink.xsd](https://www.w3.org/2021/06/musicxml40/listings/xlink.xsd/)
		- [xml.xsd](https://www.w3.org/2021/06/musicxml40/listings/xml.xsd/)
		- [container.xsd](https://www.w3.org/2021/06/musicxml40/listings/container.xsd/)
		- [opus.xsd](https://www.w3.org/2021/06/musicxml40/listings/opus.xsd/)
		- [sounds.xsd](https://www.w3.org/2021/06/musicxml40/listings/sounds.xsd/)
		- [sounds.xml](https://www.w3.org/2021/06/musicxml40/listings/sounds.xml/)
		- [catalog.xml](https://www.w3.org/2021/06/musicxml40/listings/catalog.xml/)
		- [to31.xsl](https://www.w3.org/2021/06/musicxml40/listings/to31.xsl/)
		- [to30.xsl](https://www.w3.org/2021/06/musicxml40/listings/to30.xsl/)
		- [to20.xsl](https://www.w3.org/2021/06/musicxml40/listings/to20.xsl/)
		- [to11.xsl](https://www.w3.org/2021/06/musicxml40/listings/to11.xsl/)
		- [to10.xsl](https://www.w3.org/2021/06/musicxml40/listings/to10.xsl/)
		- [parttime.xsl](https://www.w3.org/2021/06/musicxml40/listings/parttime.xsl/)
		- [timepart.xsl](https://www.w3.org/2021/06/musicxml40/listings/timepart.xsl/)
- **Version History**
