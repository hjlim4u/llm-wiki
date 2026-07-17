---
title: MUSCIMA++ Dataset
source: https://ufal.mff.cuni.cz/muscima
created: 2026-06-14
published:
author:
type: WebReference, WebReference
clip_status: ok
feature: 손글씨 악보 데이터셋
description: handwritten music notation symbol 데이터셋 설명과 다운로드 정보가 있는 페이지.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - Optical_Music_Recognition
  - Dataset
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# MUSCIMA++ Dataset

- 원문: [MUSCIMA++ Dataset](https://ufal.mff.cuni.cz/muscima)
- 관련 기능: 손글씨 악보 데이터셋
- 선별 이유: handwritten music notation symbol 데이터셋 설명과 다운로드 정보가 있는 페이지.

## 원문 클리핑

## MUSCIMA++

(Updated 2025-02-12: links to more up-to-date tools and dataset versions.)

MUSCIMA++ is a dataset of handwritten music notation for musical symbol detection. It contains 91255 symbols, consisting of both notation primitives and higher-level notation objects, such as key signatures or time signatures. There are 23352 notes in the dataset, of which 21356 have a full notehead, 1648 have an empty notehead, and 348 are grace notes. For each annotated object in an image, we provide both the bounding box, and a pixel mask that defines exactly which pixels within the bounding box belong to the given object. Composite constructions, such as notes, are captured through explicitly annotated relationships of the notation primitives (noteheads, stems, beams...), thus forming the MUSCIMA++ Notation Graph, or MuNG. This way, the annotation provides an explicit bridge between the low-level and high-level symbols described in Optical Music Recognition literature.

![](https://ufal.mff.cuni.cz/~hajicj/2017/images/intro_screenshot_1.png)

MUSCIMA++ has annotations for 140 images from the CVC-MUSCIMA dataset \[2\], used for handwritten music notation writer identification and staff removal. CVC-MUSCIMA consists of 1000 binary images: 20 pages of music were each re-written by 50 musicians, binarized, and staves were removed. We had 7 different annotators marking musical symbols: each annotator marked one of each 20 CVC-MUSCIMA pages, with the writers selected so that the 140 images cover 2-3 images from each of the 50 CVC-MUSCIMA writers. This setup ensures maximal variability of handwriting, given the limitations in annotation resources.

The MUSCIMA++ dataset is intended for musical symbol detection and classification, and for music notation reconstruction. A thorough description of its design is published on arXiv \[2\]: [https://arxiv.org/abs/1703.04824](https://arxiv.org/abs/1703.04824) The full definition of MuNG, the ground truth format, is given in the form of [annotator instructions](https://muscimarker.readthedocs.io/en/develop/instructions.html).

## License

(Let's get the legal stuff out of the way first.)

The MUSCIMA++ dataset is licensed under the Creative Commons 4.0 Attribution NonCommercial Share-Alike license (CC-BY-NC-SA 4.0). The full text of the license is in the LICENSE file that comes with the dataset.

The attribution requested for MUSCIMA++ is to cite the following ICDAR 2017 article \[1\]:

\[1\] Jan Hajič jr. and Pavel Pecina. The MUSCIMA++ Dataset for Handwritten Optical Music Recognition. *14th International Conference on Document Analysis and Recognition, ICDAR 2017.* Kyoto, Japan, November 13-15, pp. 39-46, 2017.

And because MUSCIMA++ is a derivative work of CVC-MUSCIMA, we request that you follow the authors’ attribution rules for CVC-MUSCIMA as well, and cite article \[2\]:

\[2\] Alicia Fornés, Anjan Dutta, Albert Gordo, Josep Lladós. CVC-MUSCIMA: A Ground-truth of Handwritten Music Score Images for Writer Identification and Staff Removal. *International Journal on Document Analysis and Recognition*, Volume 15, Issue 3, pp 243-251, 2012. (DOI: 10.1007/s10032-011-0168-2).

*Note (2018-01-05): The attribution \[1\] changed to a peer-reviewed article for MUSCIMA++,* *from the earlier arXiv.org submission:*

*\[3\] Jan Hajič jr., Pavel Pecina. In Search of a Dataset for Handwritten Optical Music Recognition: Introducing MUSCIMA++. *CoRR, arXiv:1703.04824*, 2017. [https://arxiv.org/abs/1703.04824](https://arxiv.org/abs/1703.04824).*

### Tools

Apart from the symbol annotation data themselves, we also provide two Python packages:

- [mung](https://github.com/OMR-Research/mung), which is basically an I/O interface to the dataset (also available through pip install mung)
- [MUSCIMarker](https://lindat.mff.cuni.cz/repository/xmlui/handle/11234/1-1850), which is the annotation tool used to create the dataset (note: you need Python <3.6 to run it, it's old)

We believe the functionality in `muscima` will make it easier for you to *use* the dataset. You don’t need MUSCIMarker unless you want to extend the dataset, although it is also nifty for visualization. If you do not want to use the Python interface, you can of course make your own: the data is stored as a regular XML file, described in detail in the README (and also in the `muscima.io` module).

## First Steps

[Download the latest version here](http://hdl.handle.net/11372/LRT-2372) [(v2.1)](https://github.com/OMR-Research/muscima-pp/)

Install the **mung** package: [https://github.com/OMR-Research/mung](https://github.com/OMR-Research/mung)

Follow the Musicma++ [tutorial](https://muscima.readthedocs.io/en/latest/Tutorial.html).

To understand how to leverage the dataset for your particular use case, you will need to familiarize yourself with how the MuNG ground truth is defined in detail. To this end, see the [annotation instructions](https://muscimarker.readthedocs.io/en/develop/instructions.html) as a reference guide. If you want to look at the notation graph, you can use the [MUSCIMarker](https://muscimarker.readthedocs.io/en/develop/) GUI app.

#### Getting the CVC-MUSCIMA Images

As a part of the agreement that enabled us to release MUSCIMA++ under a permissive license, we do not distribute the underlying CVC-MUSCIMA images themselves, only the annotations. To get these underlying images, you will need to download the CVC-MUSCIMA staff removal dataset:

[http://www.cvc.uab.es/cvcmuscima/index\_database.html](http://www.cvc.uab.es/cvcmuscima/index_database.html)

Then, use the `get_images_from_muscima.py` script from the `muscima` package, using ``-i `cat specifications/cvc-muscima-image-list.txt`` \`, and specify `data/images` as the target directory. This will extract the 140 annotated symbol images for which there are annotations, with the correct filenames.

## Ground Truth

The MUSCIMA++ dataset v1.0 is suitable for musical symbol detection (localization, classification) and notation reconstruction, and in the next minor version (1.1, expected in December 2017), full MIDI inference as well.

We annotated notation primitives (noteheads, stems, beams, barlines), as well as higher-level, “semantic” objects (key signatures, voltas, measure separators). For each annotated object in an image, we provide both the bounding box, and a pixel mask that defines exactly which pixels within the bounding box belong to the given object.

In addition to the objects, we annotate their *relationships*. The relationships are oriented edges that generally encode attachment: a stem is attached to a notehead, a sharp is attached to a key signature, or a barline is attached to a repeat sign.

We purposefully did *not* annotate notes, as what constitutes a note on paper is not well-defined, and what is traditionally considered a “note” graphical object does not map well onto the musical concept of a “note” with a pitch, duration, amplitude, and timbre. Instead of defining graphical note objects, we define *relationships* between notation primitives, so that the musical notes can be deterministically reconstructed. Notehead primitives (`notehead-full`, `notehead-empty`, and their grace note counterparts) should provide a 1:1 interface to major notation semantics representations such as MusicXML or MEI.

Formally, the annotation is a directed graph of notation objects, each of which is associated with a subset of foreground pixels in the annotated image. We keep this graph acyclic.

The ground truth format is called "MUSCIMA++ Notation Graph", or MuNG for short.

Our [Introducing MUSCIMA++ article](https://arxiv.org/abs/1703.04824) \[2\] contains a broader discussion of the ground truth design. The full definition the MUSCIMA++ ground truth (current version: 0.9.1) is captured in the annotation guidelines:

[http://muscimarker.readthedocs.io/en/develop/instructions.html](http://muscimarker.readthedocs.io/en/develop/instructions.html)

The data formats are described in detail in the README file provided inside the dataset.

## Contact

Any questions, requests, bug reports? Go to the muscima package github repository and [file an issue](https://github.com/hajicj/muscima/issues), with the "MuNG" label. If you have a question about a specific situation in the dataset, or you wish to provide an example for your question, don't forget to include the unique identifier (uid) of the symbol(s) in question, to help us quickly find the context for your issue.

Or, contact the authors:

`hajicj@ufal.mff.cuni.cz`

Especially reports of errors in annotation are welcome! We will do our best to maintain a list of *errata* and release new dataset versions with bugs fixed.

## Known issues

The MUSCIMA++ 1.0 dataset is not perfect, as is always the case with extensive human-annotated datasets. In the interest of full disclosure and managing expectations, we list the known issues. We will do our best to deal with them in follow-up version of MUSCIMA++. If you find some errors that are not on this list and should be, especially problems that seem systematic, [file a github issue](https://github.com/hajicj/muscima/issues) with the "MuNG" label, or drop us a line at:

```html
hajicj@ufal.mff.cuni.cz
```

(We prefer GitHub issues because they make it easier for others to find the answers to the same problems.)

Of course, we will greatly appreciate any effort towards fixing these issues!

We hope that this dataset is going to eventually become an OMR community effort, with all the bells and whistles – including co-authorship credit for future versions, esp. if you come up with bug-hunting and/or annotation automation.

The list of current errors and their status is in the ERRATA file provided with the dataset. **We are much obliged to [Alexander Pacha,](https://www.ims.tuwien.ac.at/people/alexander-pacha) who went through all 90000+ symbols to discover the errors fixed in v0.9.1!**

### Staff removal artifacts

The CVC-MUSCIMA dataset has had staff lines removed automatically with very high accuracy, based on a precise writing and scanning setup (using a standard notation paper and a specific pen across all 50 writers). However, there are still some errors in staff removal: sometimes, the staff removal algorithm took with it some pixels that were also legitimate part of a symbol. This manifests itself most frequently with stems.

## Bibliography

\[1\] Jan Hajič jr., Pavel Pecina. In Search of a Dataset for Handwritten Optical Music Recognition: Introducing MUSCIMA++. *CoRR, arXiv:1703.04824*, [https://arxiv.org/abs/1703.04824](https://arxiv.org/abs/1703.04824)

\[2\] Alicia Fornés, Anjan Dutta, Albert Gordo, Josep Lladós. CVC-MUSCIMA: A Ground-truth of Handwritten Music Score Images for Writer Identification and Staff Removal. *International Journal on Document Analysis and Recognition*, Volume 15, Issue 3, pp 243-251, 2012. (DOI: 10.1007/s10032-011-0168-2).
