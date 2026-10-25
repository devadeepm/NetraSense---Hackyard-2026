# NetraSense - Adaptive Retinal Screening AI & 3D-Printed Hardware (Hackyard 2026)

BUILD 2026 Submission  
An end-to-end, low-cost diabetic retinopathy (DR) screening pipeline combining a 3D-printed smartphone adapter, MATLAB-assisted optical quality gating, multi-task lesion segmentation, and KL-anchored clinician RLHF.

---

## Project Demo & Presentation
* **Watch the Video Demo:** [NetraSense Demo Walkthrough (Google Drive)](https://drive.google.com/file/d/14a7HKVSnaQPbePSgQ4wUk6hhX6Ago4Qr/view?usp=sharing)
* **Sample Fundus & Result Images:** [NetraSense Demo Images Folder (Google Drive)](https://drive.google.com/drive/folders/1maapR4iSoNl-SaP4cdFXWEq9AVurF7XF?usp=sharing)
* **Slide Presentation:** [NetraSense_Presentation.pdf](./NetraSense_Presentation.pdf)

---

## Project Overview
NetraSense bridges the gap between resource-constrained clinics and specialist-level ophthalmology. Traditional screening tools are either prohibitively expensive, suffer from high scan rejection rates due to poor lighting/blur, or remain rigid black-box classifiers that cannot adapt to local clinical feedback.

NetraSense solves this with a complete modular ecosystem:
1. **Low-Cost Hardware:** A 3D-printed smartphone-compatible fundus camera adapter (`fundus_camera_complete_assembly.stl`) that lowers equipment barriers.
2. **Pre-Diagnostic Quality Gate:** MATLAB-driven optical feature extraction (`quality_filter.m`) to validate image clarity *before* grading.
3. **Multi-Task Lesion Detection:** MATLAB-based image enhancement and lesion processing scripts (`image_enhancement.m.txt`, `hemorrhage_detection.m.txt`, `microaneurysm_detection.m.txt`) for precise localization.
4. **Adaptive ML & RLHF:** Jupyter notebook (`netrasense-hackyard-ml-rlhf.ipynb`) implementing PyTorch multi-task models and clinician reinforcement learning with KL-divergence anchoring.

---

## Repository File Structure

```text
├── NetraSense_Presentation.pdf         # Official BUILD 2026 slide presentation deck
├── README.md                           # Project documentation
├── fundus_camera_complete_assembly.stl # 3D-printable CAD assembly for smartphone adapter
├── quality_filter.m                    # MATLAB script for image acceptance/rejection quality gating
├── image_enhancement.m.txt             # MATLAB script for fundus image preprocessing & contrast enhancement
├── hemorrhage_detection.m.txt          # MATLAB script for extracting hemorrhage lesion regions
├── microaneurysm_detection.m.txt       # MATLAB script for detecting microaneurysms
└── netrasense-hackyard-ml-rlhf.ipynb   # Main ML training, inference, and RLHF adaptation notebook

What We Built During BUILD 2026
Hardware Prototyping (.stl): Designed and modeled a portable, 3D-printed smartphone fundus camera attachment to cut equipment barriers.

MATLAB Optical Pipeline (.m / .txt files):

quality_filter.m: Automatically evaluates illumination, blur, and contrast to accept or reject scans.

image_enhancement.m.txt: Enhances retinal vascular visibility.

hemorrhage_detection.m.txt & microaneurysm_detection.m.txt: Rule-based and morphological feature extraction routines for lesion localization.

Machine Learning & RLHF (.ipynb): Developed PyTorch training pipelines for multi-task DR grading and implemented KL-divergence anchored reinforcement learning from human feedback (RLHF) to safely update model weights from clinician corrections without catastrophic forgetting.

Quick Start Guide
1. Hardware Assembly
Open fundus_camera_complete_assembly.stl in any standard 3D slicer (PrusaSlicer, Cura) and print using PLA filament. Assemble with standard optical lenses and align with your smartphone camera.

2. Run MATLAB Quality & Feature Extraction
Open MATLAB and run quality_filter.m on your raw fundus images (or sample images from our Drive Folder) to verify image usability.

Use image_enhancement.m.txt, hemorrhage_detection.m.txt, and microaneurysm_detection.m.txt for preprocessing and lesion region extraction.

3. Run the ML & RLHF Notebook
Launch Jupyter Notebook or Colab:

**Bash**
jupyter notebook netrasense-hackyard-ml-rlhf.ipynb

Execute the cells to load models, perform inference, test quality gates, and run the RLHF weight-adaptation loop.

Team & Acknowledgments
Developed for Hackyard BUILD 2026 by Team OptiQ.
