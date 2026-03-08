# Mart App: Enterprise-Grade Microservices Ecosystem

Mart is a high-availability, distributed e-commerce platform designed to demonstrate modern cloud-native architecture. By decoupling the "Monolith" into specialized microservices, the system ensures fault tolerance and independent scalability—essential for handling high-traffic retail events.

## Architectural Overview

The project utilizes a **Microservices Architecture** to ensure that business domains remain independent and resilient.

* **API Gateway (Nginx):** The entry point for all client requests, handling load balancing and reverse proxying.
* **Mart Service (Node.js):** Manages core application logic, user sessions, and real-time interactions.
* **Books Service (Java):** A specialized service dedicated to high-volume catalog management.
* **Frontend (Angular):** A reactive, component-based UI for a smooth customer journey.

---

## Key Features

* **Infrastructure as Code:** Full containerization via **Docker**, enabling 1-command environment setup.
* **Smart Routing:** Nginx-orchestrated traffic management between frontend and disparate backend services.
* **Production-Ready Data:** Advanced database seeding script mirroring real-world marketplace complexity.

---

## Tech Stack

* **Frontend:** Angular
* **Backend:** Node.js, Java (Spring)
* **Infrastructure:** Docker, Docker-Compose, Nginx
* **Databases:** MongoDB, MySQL