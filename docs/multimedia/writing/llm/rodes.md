---
tags:
- multimedia
- writing
- llm
- chatgpt
- prompt engineering
- rodes
---

# RODES - Role, Objective, Details, Examples, Sense Check

## Overview

The **RODES Framework** is a structured prompt design method that ensures clear, relevant, and effective AI-generated responses. By specifying **Role, Objective, Details, Examples, and Sense Check**, this framework enhances clarity, ensures alignment with specific requirements, and verifies the AI’s understanding of the task.

### Framework Structure
```md
Role: [Insert role]
Objective: [Insert objective]
Details: [Insert context or constraints]
Examples: Here are good examples you can use to model your answer.
[Insert examples]
Sense Check: Do you understand the objective and the specific guidelines for this task?
```

## Steps for Using the RODES Framework
1. Define the **Role**
    - Assign a specific role to the AI to influence the response style and expertise level.
    - Helps tailor the language, depth, and approach.
    - Examples: “Cybersecurity Analyst”, “Product Designer”, “Financial Advisor”.
2. Specify the **Objective**
    - Clearly outline the main goal of the request.
    - Ensures that the response is focused and aligned with expectations.
    - Examples: “Write a risk assessment report”, “Draft a UX design proposal”, “Analyze financial projections for next quarter”.
3. Provide **Detailed Context**
    - Include constraints, background information, and any necessary conditions.
    - This helps refine the response for accuracy and relevance.
    - Examples: “The target audience is non-technical stakeholders”, “The document should follow GDPR compliance”, “Use real-world case studies as references”.
4. Give Clear **Examples**
    - Provide sample responses or reference points to help shape the output.
    - This enhances accuracy and ensures that the AI follows the intended format and style.
    - Examples: “Include a comparison table like in the provided example”, “Use bullet points for readability”, “Refer to Tesla’s sustainability report as a model”.
5. Perform a **Sense Check**
    - Ask the AI to validate its understanding before generating the final response.
    - Helps ensure alignment with expectations and refine the response if needed.
    - Examples: “Does this summary match the expected output?”, “Are all constraints taken into account?”, “Does this address the key business challenge?”.

### Examples

```md
Role:
You are a seasoned project manager leading a cross-functional team within a technology company. Your role is to spearhead the development and implementation of a new customer relationship management (CRM) system to enhance organizational efficiency and improve customer experience.

Objective:
Your primary objective is to successfully deliver a state-of-the-art CRM system that meets the company's unique needs. The project should streamline internal processes, optimize data management, and provide a user-friendly interface for both employees and customers. Timely delivery within the established budget and scope is crucial for project success.

Details:
Initiate the project by conducting a thorough needs analysis with key stakeholders from various departments. Collaborate with the IT team, user experience designers, and customer support to gather requirements. Develop a detailed project plan, outlining phases, milestones, and resource allocation. Clearly define roles and responsibilities within the project team and establish effective communication channels.

Examples:
Provide examples of innovative features that could be incorporated into the new CRM system, such as AI-driven analytics for customer behavior prediction, seamless integration with other enterprise systems, and personalized customer communication modules. Reference successful CRM implementations in other industries to inspire confidence in the proposed innovations.

Sense Check:
Evaluate the project's feasibility by considering potential challenges, resource constraints, and technological dependencies. Conduct regular sense checks with stakeholders to ensure alignment with organizational goals and to address any emerging issues promptly. Prioritize transparency and effective communication to maintain stakeholder confidence throughout the project lifecycle.
```
