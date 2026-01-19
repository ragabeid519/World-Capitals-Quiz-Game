# 🌍 World Capitals Quiz Game

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-8C17BE?style=for-the-badge&logo=getx&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)

An interactive quiz application built with **Flutter** to test general knowledge of world capitals. The app features real-time score tracking, local data persistence, and professional state management.

---

## 🛠 Tech Stack

* **Framework:** Flutter (GetMaterialApp) for a seamless and reactive UI.
* **State Management:** GetX (Reactive approach using `.obs`) for efficient state updates.
* **Local Storage:** GetStorage to persist the "Last Winner" data.
* **Audio Implementation:** `just_audio` for immersive sound effects on success or failure.
* **Data Utilities:** `dartx` for advanced collection manipulation, filtering, and sorting.

---

## ✨ Key Features

1. **🎮 Dynamic Gameplay:** Randomized question sets (Shuffle) with a smart searchable `DropdownMenu`.
2. **🔊 Audio Feedback:** Encouraging clap sounds on success and different tones for incorrect answers.
3. **📊 Statistics Dashboard:** A dedicated page to view all players' scores with **Search** and **Multi-Sort** (By Name/Score) functionality.
4. **💾 Winner Persistence:** Automatically saves and displays the champion of the previous round using local storage.
5. **📱 Responsive Design:** Clean UI layout that adapts to different screen sizes.

---

## 📸 App Sections

| Section | Description |

| :--- | :---<video controls src="quiz_questions.mp4" title="Title"></video> |
| **Login Page** | Player entry with duplicate name validation and hall of fame display. |
| **Quiz Arena** | Real-time question counter and interactive capital selection. |
| **Stats Center** | Advanced filtering and sorting of player performance data. |

---

## ⚙️ Installation & Setup

To run this project locally, follow these steps:

```bash
# 1. Clone the repository
git clone [https://github.com/ragabeid519/World-Capitals-Quiz-Game.git]

# 2. Install dependencies
flutter pub get

# 3. Ensure assets are ready
# Make sure your clap_success.mp3 and clap_fail.mp3 are in assets/audio/

# 4. Run the app
flutter run
## 👤 Contact

**Ragab Eid**
* **LinkedIn:** [https://www.linkedin.com/in/ragabeid/]
* **Portfolio:** [(https://boxwood-ray-479905-e5.web.app/)]

---
⭐ If you find this project helpful, please give it a **Star** to support the developer!
EOF