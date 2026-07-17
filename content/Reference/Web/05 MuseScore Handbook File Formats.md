---
title: MuseScore Handbook File Formats
source: https://musescore.org/en/handbook/3/file-formats
created: 2026-06-14
published:
author:
type: WebReference, WebReference
clip_status: ok
feature: 악보 포맷 호환성
description: MusicXML, MIDI 등 import/export 지원과 제약을 확인할 수 있는 사용자 문서.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - MusicXML
  - MIDI
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# MuseScore Handbook File Formats

- 원문: [MuseScore Handbook File Formats](https://musescore.org/en/handbook/3/file-formats)
- 관련 기능: 악보 포맷 호환성
- 선별 이유: MusicXML, MIDI 등 import/export 지원과 제약을 확인할 수 있는 사용자 문서.

## 원문 클리핑

MuseScore can import and export a wide variety of file formats, allowing you to share and publish scores in the format that best meets your needs.

### MuseScore native format

See also [Native format compatibility](https://musescore.org/en/handbook/3/opensaveexportprint#Native-format-compatibility).

MuseScore [saves](https://musescore.org/en/handbook/3/opensaveexportprint#save) files in the following native formats:

**A note about fonts**: *MuseScore does not embed text fonts in saved or exported native format files. If you want your MuseScore file to be viewed by other MuseScore users, make sure you are using the built-in Edwin (since version 3.6), FreeSerif, or FreeSans font families for your text, or a font that the other parties have installed too. If a system does not have the fonts specified in your original file, MuseScore will use a fallback option, which may cause your score to appear differently.* For more see [Fonts](https://musescore.org/en/handbook/3/fonts).

#### MuseScore format (\*.mscz)

MSCZ is the standard MuseScore file format and recommended for most uses. A score saved in this format takes up very little disk space, but preserves all the necessary information. The format is a ZIP-compressed version of `.mscx` files and includes any images the score may contain and a thumbnail.

*Note*: An `.mscz` file can be unzipped using a ZIP software utility to extract an uncompressed `.mscx` file. (Note that changing the file extension from `.mscz` to `.zip` may be required to unzip the `.mscz` file, depending on the software utility used.)

#### Uncompressed MuseScore format (\*.mscx)

MSCX is the uncompressed version of the MuseScore file format. A score saved in this format will retain all information, except images. It can be opened with a text editor, allowing the user access to the file's source code.

#### MuseScore backup file (.\*.mscz,) or (.\*.mscx,)

Backup files are created automatically and saved in the same folder as your normal MuseScore file. The backup copy contains the previously saved version of the MuseScore file and can be important if your normal copy becomes corrupted, or for looking at an older version of the score.

The backup file adds a period to the beginning of the file name (`.`) and a comma (`,`) to the end (e.g. if your normal file is called " `untitled.mscz` ", the backup copy will be "`.untitled.mscz,`"), and the period and comma need to be removed from the name in order to open the backup file in MuseScore. As it is stored in the same folder as your normal MuseScore file, you may also need to give it a unique name (e.g. changing "`.untitled.mscz,`" to " `untitled-backup1.mscz` ").

**Note:** In order to see the MuseScore backup files, you may need to change your system settings to "Show hidden files". See also [How to recover a backup copy of a score](https://musescore.org/en/node/52116).

### Graphic files (export only)

MuseScore can [export](https://musescore.org/en/handbook/3/opensaveexportprint#export) a score as a graphic file in either [PDF](#pdf), [PNG](#png) or [SVG](#svg) format.

#### PDF (\*.pdf)

**PDF** (Portable Document Format) files are ideal for sharing your sheet music with others who do not need to edit the content. This is a very widely-used format and most users will have a PDF viewer of some kind on their computers.

To set the resolution of exported PDFs:

1. From the menu bar, choose Edit → Preferences... (Mac: MuseScore → Preferences...), and select the "Export" tab;
2. Set the resolution in the "PDF" section.

#### PNG (\*.png)

**PNG** (Portable Network Graphics) files are based on a bitmap image format, widely supported by software on Windows, Mac OS, and Linux, and very popular on the web. MuseScore creates PNG images as they would appear if printed, one image per page.

To set the resolution of exported PNG images:

1. From the menu bar, choose Edit → Preferences... (Mac: MuseScore → Preferences...), and select the "Export" tab;
2. Set the resolution and transparency in the PNG/SVG section.

**Note:** If you want to create images that show only parts of the score (with or without screen-only items such as frame boxes, invisible notes, and out-of-range note colors), use [Image capture](https://musescore.org/en/handbook/3/image-capture) instead.

#### SVG (\*.svg)

[SVG](http://w3.org/Graphics/SVG) (Scalable Vector Graphics) files can be opened by most web browsers (except Internet Explorer before version 9) and most vector graphics software. However, most SVG software does not support embedded fonts, so the appropriate MuseScore fonts must be installed to view these files correctly. SVG is the current format for all scores [saved](https://musescore.org/en/handbook/3/share-scores-online) on MuseScore.com.

To set resolution and transparency of exported SVG files, see the instructions under [PNG (above)](#png). Note that MuseScore does not (yet) support gradients on export (although it does for [images](https://musescore.org/en/handbook/3/images) in a score).

### Audio files (export only)

MuseScore can create *normalized*, stereo audio of the score in any of the following formats: [WAV](#wav), [MP3](#mp3), [OGG VORBIS](#ogg), [FLAC](#flac). To export an audio file:

1. From the menu, select File → Export...;
2. Choose the desired format from the dropdown menu, then press Save.

You can adjust the **sample rate** of all audio formats as follows:

1. From the menu bar, select Edit → Preferences... (Mac: MuseScore → Preferences...), and click on the [Export](https://musescore.org/en/handbook/3/preferences#export) tab;
2. Set "Sample rate" in the "Audio" section.

#### WAV audio (\*.wav)

WAV (Waveform Audio Format) is an *uncompressed* sound format. This was developed by Microsoft and IBM, and is widely supported by software for Windows, OS X, and Linux. It is an ideal format for use when creating CDs, as full sound quality is preserved. For sharing via email or the internet, use a compressed alternative such as [MP3](#mp3).

#### MP3 (\*.mp3)

**MP3** is a very widely-used compressed audio format. MP3 files are ideal for sharing and downloading over the internet due to their relatively small size.

**To set the MP3 bitrate**:

1. From the menu bar, choose Edit → Preferences... (Mac: MuseScore → Preferences...), and select the "Export" tab;
2. Set the MP3 bitrate in the "Audio" section.

#### FLAC audio (\*.flac)

[Free Lossless Audio Codec](http://xiph.org/flac) (FLAC) is compressed audio format. FLAC files are approximately half the size of uncompressed audio and just as good quality. Windows and OS X do not have built-in support for FLAC, but software such as the free and open source [VLC media player](http://videolan.org/vlc) can play FLAC files on any operating system.

#### Ogg Vorbis (\*.ogg)

[Ogg Vorbis](http://vorbis.com/) is intended as a patent-free replacement for the popular MP3 audio format (which MuseScore also supports—see above). Like MP3, Ogg Vorbis files are relatively small (often a tenth of uncompressed audio), but some sound quality is lost. Windows and OS X do not have built-in support for Ogg Vorbis. However, software such as [VLC media player](http://videolan.org/vlc) and [Firefox](http://www.mozilla.org/firefox) can play Ogg files on any operating system.

### Share with other music software

MuseScore can [import](https://musescore.org/en/handbook/3/opensaveexportprint#open-file) and [export](https://musescore.org/en/handbook/3/opensaveexportprint#export) [MusicXML](#musicxml) and [MIDI](#midi) files; it is also able to import a variety of native format files from other music notation programs.

#### MusicXML (\*.musicxml, \*.xml)

[MusicXML](http://musicxml.com/) is the universal standard format for sharing sheet music between different scorewriters—including MuseScore, Sibelius, Finale, and more than 100 others. MuseScore supports both export and import.

#### Compressed MusicXML (\*.mxl)

Compressed MusicXML creates smaller files than regular MusicXML. This is a newer standard and isn't as widely supported by older scorewriters, but MuseScore has full import and export support.

#### MIDI (\*.mid, \*.midi, \*.kar)

**MIDI** (Musical Instrument Digital Interface) is a format widely supported by sequencers and music notation software. For details of the protocol see the [MIDI Association](https://midi.org/) website.

MIDI files are very useful for playback purposes but contain little in the way of score layout information (formatting, pitch spelling, voicing, ornaments, articulations, repeats, key signatures etc.). To share files between *different* music notation software, [MusicXML](#musicxml) is recommended instead.

For details about how to import MIDI files see [MIDI import](https://musescore.org/en/handbook/3/midi-import).

#### MuseData (\*.md) (import only)

[MuseData](http://musedata.org/) is a format developed by Walter B. Hewlett beginning in 1983 as an early means of sharing music notation between software. It has since been eclipsed by MusicXML, but several thousand scores in this format are still available online.

#### Capella (\*.cap, \*.capx) (import only)

CAP and CAPX files are created by the score writer, [Capella](http://capella-software.com/). MuseScore imports version 2000 (3.0) or later fairly accurately.

#### Bagpipe Music Writer (\*.bww) (import only)

BWW files are created by the niche score writer, [Bagpipe Music Writer](http://robertmacneilmusicworks.com/).

#### BB (\*.mgu, \*.sgu) (import only)

BB files are created by the music arranging software, [Band-in-a-Box](http://pgmusic.com/). MuseScore's support is currently experimental.

#### Overture / Score Writer (\*.ove, \*.scw) (import only)

OVE files are created by the score writer [Overture](https://sonicscores.com/overture/) 4 or older. This format is mainly popular in Chinese-language environments, such as Mainland China, Hong Kong, and Taiwan. Overture 5, the current version of Overture, uses the extension.ovex, which MuseScore can't read.  
SCW files are created by [Score Writer](https://sonicscores.com/score-writer/), they are identical to OVE files, only differences is the extension.  
MuseScore's support is currently experimental and seems to support Overture / Score Writer 3 and 4 only.

#### Guitar Pro (various—import only)

MuseScore can open [Guitar Pro](http://guitar-pro.com/) files with the following extensions: \*.gtp, \*.gp3, \*.gp4, \*.gp5, \*.gpx, and, as of version 3.5, \*.gp.

#### Power Tab Editor (\*.ptb) (import only)

PTB files are created by [Power Tab Editor](http://www.power-tab.net/). MuseScore's support is currently experimental.

### See also

- [Open/Save/Export/Print](https://musescore.org/en/handbook/3/opensaveexportprint)
- [Recovered files](https://musescore.org/en/handbook/3/recovered-files)

### External links

- [How to recover a backup copy of a score](https://musescore.org/en/node/52116) (MuseScore HowTo)
