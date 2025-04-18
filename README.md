# 📱 DinDin Problems Report (Mini Platform Project)

DinDin Problems Report is a mobile and web-based platform developed for Mae Fah Luang University students and staff to **report and track problems**, such as broken equipment, and communicate with a **chatbot assistant**. The system is built with a modular architecture for scalability and maintainability.

---

## 🧩 System Architecture

The platform is divided into 7 layers:

1. **User Interface (UI) Layer**  
   - 📱 **Mobile App**: Used by students to report problems and chat with the DinDin bot.  
   - 💻 **Web Dashboard**: Used by staff (admins) to manage reported problems.

2. **Application Logic Layer**  
   - Handles core logic like reporting flow and notifications.

3. **Web Logic Layer**  
   - Manages backend processes specific to the web dashboard.

4. **ChatBot Layer**  
   - 🧠 Built with Flask for intent recognition and conversation flow.

5. **Data Management Layer**  
   - Firebase Firestore for database  
   - 🔐 Data analytics and encryption

6. **Integration Layer**  
   - API gateway and third-party service connections

7. **Infrastructure Layer**  
   - ☁️ Cloud services and Docker containerization for deployment

---

## 🗃️ Database Design

- **Student — Report**: One-to-Many (A student can have many reports, but a report must belong to one student)
- **Admin — Report**: Many-to-Many (Reports can be managed by multiple admins)

## 💼 Business Model: Internal Sponsorship

- 💰 **Funding**: Provided by the university
- 👨‍💻 **Developer**: Builds and maintains the app
- 📱 **Product**: The DinDin app itself
- 👥 **User**: Students and staff report issues
- 🛠️ **Maintenance Division**: Responds to issues via the app

---

## ✅ Functional Requirements

| Code | Role | Description |
|------|------|-------------|
| F01 | User | Login via MFU email |
| F02 | User | Submit problem report |
| F03 | User | Chat with chatbot |
| F04 | User | View report status |
| F05 | User | View MFU news |
| F06 | Admin | Admin login via MFU email |
| F07 | Admin | Update and delete reports |

---

## 🔐 Non-Functional Requirements

- **Usability**: Intuitive, chatbot + manual reporting
- **Security**: Google Sign-In, no password stored

---

## 🧪 Quality Attributes

- **Usability**: Easy to use for all user levels
- **Maintainability**: Modular structure, easy updates
- **Availability**: Cloud-hosted, real-time access
- **Modifiability**: Flexible to extend features
- **Reusability**: Modules reusable for future systems

---

## 🎨 User Interface & Experience

### 🧍‍♂️ User Pages

- **HomePage**: Access chatbot, problem report, MFU news, and history
- **MFU News**: Opens university news page
- **Problem Report**: Submit reports with photo & location
- **Chat Page**: Chat with DinDin chatbot
- **Problem Status**: Track repair progress

### 🛠 Admin Pages

- **Report Request**: Mark reports as complete
- **Completed Report**: View & delete completed reports

---

## 📦 Technologies Used

- **Flutter**: Mobile development
- **Firebase Firestore**: Database
- **Flask API**: Chatbot backend

---

## 👥 Team

This project was developed by students under the internal sponsorship model of Mae Fah Luang University.

---

