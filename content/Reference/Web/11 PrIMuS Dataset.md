---
title: PrIMuS Dataset
source: https://grfia.dlsi.ua.es/primus/
created: 2026-06-14
published:
author:
type: WebReference, WebReference
clip_status: ok
feature: OMR 데이터셋
description: monophonic score OMR 연구용 PrIMuS와 Camera-PrIMuS 데이터셋 설명 페이지.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - Optical_Music_Recognition
  - Dataset
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# PrIMuS Dataset

- 원문: [PrIMuS Dataset](https://grfia.dlsi.ua.es/primus/)
- 관련 기능: OMR 데이터셋
- 선별 이유: monophonic score OMR 연구용 PrIMuS와 Camera-PrIMuS 데이터셋 설명 페이지.

## 원문 클리핑

## The Printed Images of Music Staves (PrIMuS) dataset

This dataset was created for the paper:

*Calvo-Zaragoza, J.; Rizo, D. [End-to-End Neural Optical Music Recognition of Monophonic Scores](http://www.mdpi.com/2076-3417/8/4/606). Appl. Sci. 2018, 8, 606*

## Introduction

It is well known that machine learning-based systems require training sets of the highest quality and size. The *Printed Images of Music Staves* (PrIMuS) dataset has been devised to fulfill both requirements in Optical Music Recognition (OMR) research. Thus, the objective pursued when creating this ground-truth data is not to represent the most complex musical notation corpus, but collect the highest possible number of scores ready to be represented in formats suitable for heterogeneous OMR experimentation and evaluation.

PrIMuS contains 87678 real-music incipits (an incipit is a sequence of notes, typically the first ones, used for identifying a melody or musical work), each one represented by five files: the Plaine and Easie code source, an image with the rendered score, the musical symbolic representation of the incipit both in Music Encoding Initiative format (MEI) and in an on-purpose simplified encoding (semantic encoding), and a sequence containing the graphical symbols shown in the score with their position in the staff without any musical meaning (agnostic encoding). These two on-purpose agnostic and semantic representations are described below.

Pursuing the objective of considering real music, and being restricted to use short single-staff scores, an export in PAEC format of the [RISM dataset](http://opac.rism.info/) has been used as source. The PAEC is then formatted to be fed into the musical engraver [Verovio](https://www.verovio.org/), that outputs both the musical score in SVG format---that is posteriorly converted into PNG format---and the MEI encoding containing the symbolic semantic representation of the score in XML format. Verovio is able to render scores using three different fonts, namely: Leipzig, Bravura, and Gootville, which increases the variability of the generated images.

An example from PrIMuS is depicted in the following figure:

![Example from PrIMuS](https://grfia.dlsi.ua.es/primus/primus_example.png)
- [PrIMuS dataset](https://grfia.dlsi.ua.es/primus/packages/primusCalvoRizoAppliedSciences2018.tgz)
- [Source code to perform OMR experiments](https://github.com/calvozaragoza/tf-deep-omr)

## Camera-PrIMuS

Camera-PrIMuS is an extension of the PrIMuS dataset, for which the PNG image files have been distorted in order to simulate imperfections introduced by taking pictures of sheet music in a real scenario. To simulate distortions, the [GraphicsMagick image processing tool](http://www.graphicsmagick.org/) has been considered. Among the huge amount of filters this tool contains, a number of them have been used and tweaked empirically.

More details are provided in:

*Calvo-Zaragoza, J.; Rizo, D. [Camera-PrIMuS: Neural end-to-end Optical Music Recognition on realistic monophonic scores](http://ismir2018.ircam.fr/doc/pdfs/33.pdf). In Proceedings of the 19th International Society for Music Information Retrieval Conference, Paris. 2018, pp. 248-255*

As the incipits are the same as in the original dataset, the following link only provides the images and the ground-truth encoding.

An example from Camera-PrIMuS is depicted in the following figure:

![Example from Camera-PrIMuS](https://grfia.dlsi.ua.es/primus/camera-primus_example.png)
- [Camera-PrIMuS dataset](https://grfia.dlsi.ua.es/primus/packages/CameraPrIMuS.tgz)
- [Source code to perform OMR experiments](https://github.com/calvozaragoza/tf-deep-omr)

## Ground truth representations

Two representations have been devised on-purpose for this data, namely the semantic and the agnostic ones. The former contains symbols with musical meaning, e.g., a D Major key signature; the latter consists of musical symbols without musical meaning that should be eventually interpreted in a final parsing stage. In the agnostic representation, a D Major key signature is represented as a sequence of two “sharp” symbols. Note that from a graphical point of view, a sharp symbol in a key signature is the same as a sharp accidental altering the pitch of a note. This way, the alphabet used for the agnostic representation is much smaller, which allows us to study the impact of the alphabet size and the number of examples shown to the network for its training. Both representations are used to encode single staves as one-dimensional sequences in order to make feasible their use by the neural network models. For avoiding later assumptions on the behavior of the network, every item in the sequence is self-contained, i.e., no contextual information is required to interpret it. For practical issues, none of the representations is musically exhaustive, but representative enough to serve as a starting point from which to build more complex systems.

The semantic representation is a simple format containing the sequence of symbols in the score with their musical meaning. In spite of the myriad of monodic melody formats available in the literature, this on-purpose format has been introduced for making it easy to align it to the agnostic representation and grow-it in the future in the direction this research requires. As an example, the original Plaine and Easie code has not been directly used for avoiding its abbreviated writing that allows omitting part of the encoding by using previously encoded slices of the incipit. We want the neural network to receive a self-contained chunk of information for each musical element. Anyway, the original Plaine and Easie code and a full-fledged MEI file is maintained for each incipit that may be used to generate any other format.

The agnostic representation contains a list of graphical symbols in the score, each of them tagged given a catalog of pictograms without a predefined musical meaning and located in a position in the staff (e.g., third line, first space). The Cartesian plane position of symbols has been encoded relatively, following a left-to-right, top-down ordering. In order to represent beaming of notes, they have been vertically sliced generating non-musical pictograms. As mentioned above, this new way of encoding complex information in a simple sequence allows us to train a neural network in a relatively easy way.

The ground truth representation are formalized in the paper referenced above.

## Tools

### Semantic to MIDI Converter

We have built a Java-based tool that allows generating a MIDI file from the semantic representation:

- [Semantic to MIDI Converter](https://grfia.dlsi.ua.es/primus/primus_converter.tgz)
