---
title: Soundslice MusicXML Import Help
source: https://www.soundslice.com/help/en/creating/importing/63/musicxml/
created: 2026-06-14
published:
author:
type: WebReference, WebReference
clip_status: ok
feature: MusicXML import UX
description: 웹 기반 악보 서비스의 MusicXML import 절차와 제약을 설명한 도움말.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - MusicXML
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Soundslice MusicXML Import Help

- 원문: [Soundslice MusicXML Import Help](https://www.soundslice.com/help/en/creating/importing/63/musicxml/)
- 관련 기능: MusicXML import UX
- 선별 이유: 웹 기반 악보 서비스의 MusicXML import 절차와 제약을 설명한 도움말.

## 원문 클리핑

## Importing MusicXML into Soundslice

MusicXML is an open standard for sharing music notation data, letting you export from one music notation program into another. Every major music notation program can export in this format.

Soundslice has a world-class MusicXML importer — which means you can create music in any other notation program and bring that music into Soundslice with very little effort.

To import a MusicXML file into your Soundslice account, follow the instructions in [How to import a notation file](https://www.soundslice.com/help/en/notation-editor/importing/71/importing/). You can also do [bulk import](https://www.soundslice.com/help/en/notation-editor/importing/72/bulk-uploading/).

Here are some FAQs about MusicXML and Soundslice:

## Should I use compressed or uncompressed MusicXML?

It makes absolutely no difference to us. We support both.

## Which notation-editing programs do you recommend for creating MusicXML?

Perhaps this answer is cheating, but: we recommend using [our own notation editor](https://www.soundslice.com/help/en/notation-editor/) first and foremost. This way you have full control over your music’s display in Soundslice and don’t have to go through the MusicXML middleman.

But if that’s not an option for whatever reason, see our specific pages with tips for these programs: [Sibelius](https://www.soundslice.com/help/en/notation-editor/importing/68/sibelius/), [Finale](https://www.soundslice.com/help/en/notation-editor/importing/67/finale/), [MuseScore](https://www.soundslice.com/help/en/notation-editor/importing/69/musescore/).

If you use Guitar Pro, PowerTab or TuxGuitar: do not export MusicXML from those programs for Soundslice, because their MusicXML files exclude some information. We support their native file formats directly.

If you’re notating tablature, we recommend using Guitar Pro, because MusicXML tends to lose information about guitaristic things like bends and harmonics. Our native Guitar Pro importer will do a much higher-fidelity conversion.

## Do things get lost in translation when saved as MusicXML?

Sometimes, yes. It depends on the specific notations your music uses, and it depends on how comprehensive (or buggy) your notation editor’s MusicXML export feature is. If your music is relatively standard, you shouldn’t have any problems.

We have spent *years* polishing our MusicXML importer, and we’ve processed hundreds of thousands of files, so our importer does a solid job. Still, if you see any weirdness in your freshly imported MusicXML, [drop us an email with the MusicXML file](https://www.soundslice.com/contact/) and let us know what the problem is. We might be able to improve our importer, and we take a somewhat sadistic pleasure in building systems to deal with oddly encoded files.

## When Soundslice improves its MusicXML importer, does that mean my existing slices will change?

No. Once you’ve imported a MusicXML file into Soundslice, it gets converted into our own internal format. Any subsequent improvements to our importer will not affect the files you’ve already imported.

However, if all your friends are talking about our latest-and-greatest MusicXML importer improvements (perhaps they read [our product updates blog](https://www.soundslice.com/blog/)), then you can always [re-import a MusicXML file](https://www.soundslice.com/help/en/notation-editor/importing/52/re-importing/) to take advantage of the latest importer.
