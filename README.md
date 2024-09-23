# **Quantium Data Analytics Virtual Internship**

## Project Overview
This project is part of Quantium's Data Analytics Virtual Internship, I analyzed customer segmentation and purchasing behaviors in the chips category to guide strategic decisions for the upcoming six months. The project is divided into three tasks:

1. **Data Preparation and Customer Analytics**: Insights from transaction data to uncover customer purchasing patterns.
2. **Experimentation and Uplift Testing**: Measure the impact of trial store layouts on customer sales.
3. **Analytics and Commercial Application**: Develop a detailed report with actionable commercial insights.

## Sales and Customer Analysis

### Revenue Overview
- **Total Yearly Revenue**: $1,934,415
- **Units Sold**: 505,124 bags
- **Average Price per Bag**: $3.83

### Store Performance Metrics
- **Daily Sales**: $5,314
- **Bags Sold Daily**: 1,388
- **Monthly Sales**: $161,201

### Average Transaction Metrics
- **Revenue per Transaction**: $7.3
- **Bags per Transaction**: 1.9
- **Average Bag Size**: 182.4g

### Customer Demographics
- **Lifestage Segmentation**: The majority of customers belong to **Older Singles/Couples** and **Retirees**, followed by **Young Singles/Couples** and **Older Families**.
- **Premium Type Distribution**: 
  - **Mainstream** customers dominate, particularly in **Older demographics**.
  - **Premium** customers epresent a minor portion, dominated by **Older Singles/Couples**, **Retirees**, and **Young Singles/Couples**.
  - **Budget** customers has the most significant share in **Older demographics** as well.

Access [here](https://public.tableau.com/app/profile/tiffany.hou8743/viz/QuantiumChipAnalysis/Dashboard1?publish=yes) for live and interactive dashboards.

<img width="995" alt="Quantium Chip Analysis" src="https://github.com/user-attachments/assets/e54b9cee-da4d-435c-88e7-9132ced89122">


#### **1. Total Sales by Month**
December shows the highest chip sales, likely due to increased holiday gatherings and celebrations (Christmas, New Year). This period presents a prime opportunity for targeted promotions.

#### **2. Total Sales by Chip Brand and Size**
- **Top Brand**: Kettle is the leading chip brand, contributing **20%** of total sales.
- **Top Size**: The **175g** size is the most popular, accounting for **25.1%** of total sales, followed by the **150g** size at **15.7%**.

#### **3. Total Sales by Premium Type Lifestage**
- **Mainstream** customers dominate purchasing behavior, accounting for **38.8%** of total sales.
- **Budget** customers contribute **35%**, and **Premium** customers account for **26.2%**.

#### **4. Total Sales by Lifestage**
- **Older Singles/Couples** lead with **20.8%** of total sales.
- **Retirees** follow closely at **18.9%**, with **Older Families** contributing **18.3%**.
- **Midage Singles/Couples** and **New Families** show weaker performance, contributing **9.6%** and **2.6%**, respectively.

#### **5. RFM Segmentation**
RFM (Recency, Frequency, Monetary) analysis was conducted to segment customers based on their purchasing behaviors, resulting in the identification of seven customer segments. Customers were scored on a 1-5 scale across the three dimensions:
-  **Recency**   - **Average Recency**: **104.64**
-  **Frequency**   - **Average Frequency**: **3.65**
-  **Monetary**  - **Average Monetary**: **26.63**
    
---

### Recommendations:

1. **Maximize Seasonal Sales:** Leverage December’s peak with holiday-themed promotions and limited-edition flavors. Implement a February recovery plan with attractive discounts.

2. **Optimize Brand Strategy:**  Increase shelf space for top-performing brands, highlight mid-range options in gourmet sections, and reevaluate underperforming brands for potential replacement.

3. **Focus on Popular Sizes:**  Prioritize the 175g and 150g sizes for stocking and promotions. Offer bulk discounts during holidays and events, and reconsider strategies for lower-performing sizes.

4. **Target Specific Demographics:** Cater to older demographics with premium and health-conscious options. Promote family-size packs for young families, and introduce trendy flavors for younger singles/couples with tailored strategies for each life stage.

5. **Tailor Promotions by Segment:** Focus on value-for-money promotions for mainstream customers, offer multi-buy deals for budget-conscious buyers, and emphasize quality and exclusivity for premium customers.

6. **Enhance Family Offerings:** Provide value packs and family-size options for Older and Young Families. Create personalized loyalty programs for Older Singles/Couples and Retirees.

7. **Reactivate Inactive Segments:** Implement personalized reactivation campaigns for Young Singles/Couples and Retirees. Introduce affordable, health-focused products for Older Singles/Couples.

8. **Strengthen Customer Retention:** Maintain Mainstream customer engagement with consistent quality and loyalty programs. Boost Budget customer retention with value-driven promotions, and nurture Premium segments with exclusive offerings and personalized marketing.

## Trial Store Performance
Julia asked us to evaluate the performance of a store trial conducted in stores 77, 86, and 88. The analysis focuses on the following key metrics:

1. **Total Sales Revenue**
2. **Total Number of Customers**
3. **Average Number of Transactions per Customer**

### Methodology
We used Pearson correlations and normalized magnitude distance to assess store performance, generating a combined score. Hypothesis testing was then applied to determine if there were significant differences in the performance of the control stores (those with the highest scores) compared to the trial stores.

### Control and Trial Store Pairs
- **Store 77 and Store 233**
- **Store 86 and Store 155**
- **Store 88 and Store 40**

### Key Insights
- **Total Sales**: Store 77 experienced a statistically significant increase in total sales during March and April, exceeding the 95% control threshold. Store 86 saw a significant increase in March.
- **Number of Customers**: Stores 77 and 86 both showed significant increases in customer numbers in at least two months.
- **Store 88**: There was no statistically significant change in performance for total sales and number of customers.
<p align="center">
    <img width="30%" alt="Screenshot 2024-09-09 at 9 48 18 PM" src="https://github.com/user-attachments/assets/96ce06f5-7063-4153-aa1d-99fdb1c8de40">
  <img width="30%" alt="Screenshot 2024-09-09 at 9 48 24 PM" src="https://github.com/user-attachments/assets/9c8c5720-c9df-48a3-ba0c-eadd1cc50829">    <img width="30%" alt="Screenshot 2024-09-09 at 9 48 30 PM" src="https://github.com/user-attachments/assets/e632decd-8f58-4a48-82d1-35cb3d4fc95d">
</p>
<p align="center">
  <img width="30%" alt="Screenshot 2024-09-10 at 3 21 33 AM" src="https://github.com/user-attachments/assets/271786ad-a929-4612-b155-8855692d95fd">
  <img width="30%" alt="Screenshot 2024-09-10 at 3 21 40 AM" src="https://github.com/user-attachments/assets/42e4fff6-fbf8-4d00-9f78-81e2eb444638">
  <img width="30%" alt="Screenshot 2024-09-10 at 3 21 46 AM" src="https://github.com/user-attachments/assets/b64c1793-27e2-47fe-bcb5-eb688fe13580">
</p>
