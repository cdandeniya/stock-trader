# NovaTrade (Stock Trader)

**Full-stack Java stock trading platform with role-based dashboards — Servlets, JSP, MySQL, Docker**

[![Live Demo](https://img.shields.io/badge/Live_Demo-129.158.38.59-blue?style=for-the-badge)](http://129.158.38.59/)
[![GitHub](https://img.shields.io/badge/GitHub-cdandeniya%2Fstock--trader-181717?style=for-the-badge&logo=github)](https://github.com/cdandeniya/stock-trader)

> **Try it live:** [http://129.158.38.59/](http://129.158.38.59/)  
> **Demo login:** `test@test.com` / `admin` (any role)

---

## Overview

NovaTrade simulates a brokerage platform with separate workflows for **customers**, **customer representatives**, and **managers** — MVC architecture, DAO data access, session auth, and MySQL.

<p align="center">
  <img src="stock-trader/docs/screenshots/01-login.png" alt="NovaTrade login page" width="720"/>
  <br/>
  <em>Login with role-based routing</em>
</p>

---

## Platform Screenshots

<table>
  <tr>
    <td width="50%">
      <strong>Manager</strong> — employees, reports, stock prices
      <br/><br/>
      <img src="stock-trader/docs/screenshots/02-manager-dashboard.png" alt="Manager dashboard" width="100%"/>
    </td>
    <td width="50%">
      <strong>Customer</strong> — orders, portfolio, stock search
      <br/><br/>
      <img src="stock-trader/docs/screenshots/03-customer-dashboard.png" alt="Customer dashboard" width="100%"/>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <strong>Customer representative</strong> — client orders & customer management
      <br/><br/>
      <img src="stock-trader/docs/screenshots/04-representative-dashboard.png" alt="Representative dashboard" width="720"/>
    </td>
  </tr>
</table>

---

## Tech Stack

Java 8 · Servlets · JSP · MySQL · Bootstrap · Maven · Tomcat · Docker · Oracle Cloud

| Role | Email | Password |
|------|-------|----------|
| Quick demo | `test@test.com` | `admin` |
| Manager | `dwarren@cs.sunysb.edu` | `admin789` |
| Customer rep | `dsmith@cs.sunysb.edu` | `rep456` |
| Customer | `lewis.p@cs.sunysb.edu` | `password123` |

---

## Quick Start

```bash
git clone https://github.com/cdandeniya/stock-trader.git
cd stock-trader/stock-trader
docker compose up -d --build
```

Full setup, architecture, and deployment details: **[stock-trader/README.md](stock-trader/README.md)**

---

**Live demo:** [http://129.158.38.59/](http://129.158.38.59/)
