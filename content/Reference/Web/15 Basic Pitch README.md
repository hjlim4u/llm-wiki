---
title: Basic Pitch README
source: https://github.com/spotify/basic-pitch
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: audio-to-MIDI
description: 오디오에서 MIDI를 생성하는 Basic Pitch 설치/사용법과 모델 설명이 있는 README.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - Audio_To_MIDI
  - MIDI
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Basic Pitch README

- 원문: [Basic Pitch README](https://github.com/spotify/basic-pitch)
- 관련 기능: audio-to-MIDI
- 선별 이유: 오디오에서 MIDI를 생성하는 Basic Pitch 설치/사용법과 모델 설명이 있는 README.

## 원문 클리핑

[![Basic Pitch Logo](https://user-images.githubusercontent.com/213293/167478083-de988de2-9137-4325-8a5f-ceeb51233753.png)](https://user-images.githubusercontent.com/213293/167478083-de988de2-9137-4325-8a5f-ceeb51233753.png)

[![License](https://camo.githubusercontent.com/5b60841bea9e11d9d0b0950d690c9bc554e06385634056a7d5d62a15d1a4eabe/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d4170616368655f322e302d626c75652e737667)](https://opensource.org/licenses/Apache-2.0) [![PyPI - Python Version](https://camo.githubusercontent.com/fc977a980abd1e5e4b98b5e707597b638ef48323f12310de2a9dcaded52a2b65/68747470733a2f2f696d672e736869656c64732e696f2f707970692f707976657273696f6e732f62617369632d7069746368)](https://camo.githubusercontent.com/fc977a980abd1e5e4b98b5e707597b638ef48323f12310de2a9dcaded52a2b65/68747470733a2f2f696d672e736869656c64732e696f2f707970692f707976657273696f6e732f62617369632d7069746368) [![Supported Platforms](https://camo.githubusercontent.com/983b8030421d93edbd00183938ae07aaa187232a99e8f27a00c9141ceebf4fba/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f706c6174666f726d732d6d61634f5325323025374325323057696e646f77732532302537432532304c696e75782d677265656e)](https://camo.githubusercontent.com/983b8030421d93edbd00183938ae07aaa187232a99e8f27a00c9141ceebf4fba/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f706c6174666f726d732d6d61634f5325323025374325323057696e646f77732532302537432532304c696e75782d677265656e)

Basic Pitch is a Python library for Automatic Music Transcription (AMT), using lightweight neural network developed by [Spotify's Audio Intelligence Lab](https://research.atspotify.com/audio-intelligence/). It's small, easy-to-use, `pip install` -able and `npm install` -able via its [sibling repo](https://github.com/spotify/basic-pitch-ts).

Basic Pitch may be simple, but it's is far from "basic"! `basic-pitch` is efficient and easy to use, and its multipitch support, its ability to generalize across instruments, and its note accuracy competes with much larger and more resource-hungry AMT systems.

Provide a compatible audio file and basic-pitch will generate a MIDI file, complete with pitch bends. Basic pitch is instrument-agnostic and supports polyphonic instruments, so you can freely enjoy transcription of all your favorite music, no matter what instrument is used. Basic pitch works best on one instrument at a time.

### Research Paper

This library was released in conjunction with Spotify's publication at [ICASSP 2022](https://2022.ieeeicassp.org/). You can read more about this research in the paper, [A Lightweight Instrument-Agnostic Model for Polyphonic Note Transcription and Multipitch Estimation](https://arxiv.org/abs/2203.09893).

If you use this library in academic research, consider citing it:

```
@inproceedings{2022_BittnerBRME_LightweightNoteTranscription_ICASSP,
  = {Bittner, Rachel M. and Bosch, Juan Jos\'e and Rubinstein, David and Meseguer-Brocal, Gabriel and Ewert, Sebastian},
  title= {A Lightweight Instrument-Agnostic Model for Polyphonic Note Transcription and Multipitch Estimation},
  booktitle= {Proceedings of the IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP)},
  address= {Singapore},
  year= 2022,
}
```

**Note that we have improved Basic Pitch beyond what was presented in this paper. Therefore, if you use the output of Basic Pitch in academic research, we recommend that you cite the version of the code that was used.**

### Demo

If, for whatever reason, you're not yet completely inspired, or you're just like so totally over the general vibe and stuff, checkout our snappy demo website, [basicpitch.io](https://basicpitch.io/), to experiment with our model on whatever music audio you provide!

## Installation

`basic-pitch` is available via PyPI. To install the current release:

```
pip install basic-pitch
```

To update Basic Pitch to the latest version, add `--upgrade` to the above command.

#### Compatible Environments:

- MacOS, Windows and Ubuntu operating systems
- Python versions 3.7, 3.8, 3.9, 3.10, 3.11
- **For Mac M1 hardware, we currently only support python version 3.10. Otherwise, we suggest using a virtual machine.**

### Model Runtime

Basic Pitch comes with the original TensorFlow model and the TensorFlow model converted to [CoreML](https://developer.apple.com/documentation/coreml), [TensorFlowLite](https://www.tensorflow.org/lite), and [ONNX](https://onnx.ai/). By default, Basic Pitch will *not* install TensorFlow as a dependency *unless you are using Python>=3.11*. Instead, by default, CoreML will be installed on MacOS, TensorFlowLite will be installed on Linux and ONNX will be installed on Windows. If you want to install TensorFlow along with the default model inference runtime, you can install TensorFlow via `pip install basic-pitch[tf]`.

## Usage

### Model Prediction

### Model Runtime

By default, Basic Pitch will attempt to load a model in the following order:

1. TensorFlow
2. CoreML
3. TensorFlowLite
4. ONNX

Additionally, the module variable ICASSP\_2022\_MODEL\_PATH will default to the first available version in the list.

We will explain how to override this priority list below. Because all other model serializations were converted from TensorFlow, we recommend using TensorFlow when possible. N.B. Basic Pitch does not install TensorFlow by default to save the user time when installing and running Basic Pitch.

#### Command Line Tool

This library offers a command line tool interface. A basic prediction command will generate and save a MIDI file transcription of audio at the `<input-audio-path>` to the `<output-directory>`:

```
basic-pitch <output-directory> <input-audio-path>
```

For example:

```
basic-pitch /output/directory/path /input/audio/path
```

To process more than one audio file at a time:

```
basic-pitch <output-directory> <input-audio-path-1> <input-audio-path-2> <input-audio-path-3>
```

Optionally, you may append any of the following flags to your prediction command to save additional formats of the prediction output to the `<output-directory>`:

- `--sonify-midi` to additionally save a `.wav` audio rendering of the MIDI file.
- `--save-model-outputs` to additionally save raw model outputs as an NPZ file.
- `--save-note-events` to additionally save the predicted note events as a CSV file.

If you want to use a non-default model type (e.g., use CoreML instead of TF), use the `--model-serialization` argument. The CLI will change the loaded model to the type you prefer.

To discover more parameter control, run:

```
basic-pitch --help
```

#### Programmatic

**predict()**

Import `basic-pitch` into your own Python code and run the [`predict`](https://github.com/spotify/basic-pitch/blob/main/basic_pitch/inference.py) functions directly, providing an `<input-audio-path>` and returning the model's prediction results:

```
from basic_pitch.inference import predict
from basic_pitch import ICASSP_2022_MODEL_PATH

model_output, midi_data, note_events = predict(<input-audio-path>)
```
- `<minimum-frequency>` & `<maximum-frequency>` (*float* s) set the maximum and minimum allowed note frequency, in Hz, returned by the model. Pitch events with frequencies outside of this range will be excluded from the prediction results.
- `model_output` is the raw model inference output
- `midi_data` is the transcribed MIDI data derived from the `model_output`
- `note_events` is a list of note events derived from the `model_output`

Note: As mentioned previously, ICASSP\_2022\_MODEL\_PATH will default to the runtime first supported in the list TensorFlow, CoreML, TensorFlowLite, ONNX.

**predict() in a loop**

To run prediction within a loop, you'll want to load the model yourself and provide `predict()` with the loaded model object itself to be used for repeated prediction calls, in order to avoid redundant and sluggish model loading.

```
import tensorflow as tf

from basic_pitch.inference import predict, Model
from basic_pitch import ICASSP_2022_MODEL_PATH

basic_pitch_model = Model(ICASSP_2022_MODEL_PATH))

for x in range():
    ...
    model_output, midi_data, note_events = predict(
        <loop-x-input-audio-path>,
        basic_pitch_model,
    )
    ...
```

**predict\_and\_save()**

If you would like `basic-pitch` orchestrate the generation and saving of our various supported output file types, you may use [`predict_and_save`](https://github.com/spotify/basic-pitch/blob/main/basic_pitch/inference.py) instead of using [`predict`](https://github.com/spotify/basic-pitch/blob/main/basic_pitch/inference.py) directly:

```
from basic_pitch.inference import predict_and_save

predict_and_save(
    <input-audio-path-list>,
    <output-directory>,
    <save-midi>,
    <sonify-midi>,
    <save-model-outputs>,
    <save-notes>,
    <model-path>
)
```

where:

- `<input-audio-path-list>` & `<output-directory>`
	- directory paths for `basic-pitch` to read from/write to.
- `<save-midi>`
	- *bool* to control generating and saving a MIDI file to the `<output-directory>`
- `<sonify-midi>`
	- *bool* to control saving a WAV audio rendering of the MIDI file to the `<output-directory>`
- `<save-model-outputs>`
	- *bool* to control saving the raw model output as a NPZ file to the `<output-directory>`
- `<save-notes>`
	- *bool* to control saving predicted note events as a CSV file `<output-directory>`
- `<model-path>`
	- *str* or *pathlib.Path* local path from where to load the model, can eg: use the path obtained with `from basic_pitch import ICASSP_2022_MODEL_PATH`

### Model Input

**Supported Audio Codecs**

`basic-pitch` accepts all sound files that are compatible with its version of [`librosa`](https://librosa.org/doc/latest/index.html), including:

- `.mp3`
- `.ogg`
- `.wav`
- `.flac`
- `.m4a`

**Mono Channel Audio Only**

While you may use stereo audio as an input to our model, at prediction time, the channels of the input will be down-mixed to mono, and then analyzed and transcribed.

**File Size/Audio Length**

This model can process any size or length of audio, but processing of larger/longer audio files could be limited by your machine's available disk space. To process these files, we recommend streaming the audio of the file, processing windows of audio at a time.

**Sample Rate**

Input audio maybe be of any sample rate, however, all audio will be resampled to 22050 Hz before processing.

### VST

Thanks to DamRsn for developing this working VST version of basic-pitch! - [https://github.com/DamRsn/NeuralNote](https://github.com/DamRsn/NeuralNote)

## Contributing

Contributions to `basic-pitch` are welcomed! See [CONTRIBUTING.md](https://github.com/spotify/basic-pitch/blob/main/CONTRIBUTING.md) for details.

`basic-pitch` is Copyright 2022 Spotify AB.

This software is licensed under the Apache License, Version 2.0 (the "Apache License"). You may choose either license to govern your use of this software only upon the condition that you accept all of the terms of either the Apache License.

You may obtain a copy of the Apache License at:

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the Apache License or the GPL License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the Apache License for the specific language governing permissions and limitations under the Apache License.
