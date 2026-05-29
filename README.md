# Content Engine

Content Engine is an automated system for generating short-form video content packages (e.g., for YouTube Shorts & Instagram Reels) using AI-powered scripting, visual generation, voiceover TTS, and batch video production workflows.

## Features
- Idea & script generation for trending topics
- Automated voiceover using ONNX TTS models
- Batch video assembly with static images and AI script
- Automated video creation via batch and PowerShell scripts
- Modular components for extending topic/niche selection

## Requirements
- **FFmpeg** (for audio/video muxing and rendering)
- **Piper TTS** (for ONNX/Microsoft voice model inference)
- Windows (scripts use `.bat` and PowerShell)

## How it works
1. The system continuously selects a random topic from a predefined pool (see `listener.ps1`).
2. For each topic:
    - Calls an API/webhook to generate a video script, title, and description using AI.
    - Saves the generated script to `script.txt` (used as voiceover input).
    - Triggers a batch script (`run.bat`) that:
        - Runs Piper TTS to synthesize voiceover audio from the script.
        - Uses FFmpeg to combine a static image and the audio into an .mp4 video output.
3. This process repeats in a loop, auto-generating videos for various viral/AI/money topics.

## FFmpeg Usage
FFmpeg is used to combine synthesized audio and a static image background into a finished MP4 video. You must have FFmpeg installed and available in your system PATH, or modify `run.bat` to point to the correct FFmpeg binary.

**Example command from `run.bat`:**

```bat
ffmpeg -loop 1 -i "image.jpg" -i "voice.wav" -c:a aac -shortest "output.mp4"
```

This overlays the voiceover audio on a static image, producing a shareable video.

## Files & Structure
- `listener.ps1`: PowerShell loop for idea/script generation and running video output
- `run.bat`: Batch script for generating TTS and running FFmpeg
- `script.txt`, `title.txt`, `description.txt`: AI-generated content for each video
- `image.jpg`: Placeholder/static image (user replaceable)
- `en_US-lessac-medium.onnx`: Voice model file for Piper TTS
- `.gitignore`: Excludes large binaries, output videos, and secrets

## Setup
1. **Install FFmpeg**: [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html) and ensure it is on your system PATH or referenced directly in `run.bat`.
2. **Install Piper TTS** and model files as required.
3. Run `listener.ps1` to start the entire automated workflow.

---

Feel free to modify the automation and scripts for your own video ideas or pipeline improvements.
