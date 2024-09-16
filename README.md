# **Quantium Data Analytics Virtual Internship**

## **Background and Project Overview:**

As a member of Quantium's retail analytics team, I've been tasked by the Category Manager for Chips to conduct an analysis aimed at gaining deeper insights into customer segments that purchase chips and their purchasing patterns within the region. The findings from this analysis will play a key role in shaping the supermarket’s strategic decisions for the chips category over the next six months.

This project consists of 3 tasks.

> Task 1: Data preparation and customer analytics

Conduct analysis on your client's transaction dataset and identify customer purchasing behaviours to generate insights and provide commercial recommendations.

> Task 2: Experimentation and uplift testing

Extend your analysis from Task 1 to help you identify benchmark stores that allow you to test the impact of the trial store layouts on customer sales.

> Task 3: Analytics and commercial application

Use your analytics and insights from Task 1 and 2 to prepare a report for your client, the Category Manager.

## **Customer Overview**

The customer base is segmented by purchasing behavior—categorized into Budget, Mainstream, and Premium—and by life stages, covering a total population of 72,637.
![customer](https://github.com/user-attachments/assets/1011a652-c32e-42c8-8241-8cb230557388)
## Sales Overview

**Total yearly revenue**: **$1,934,415**, with a total of **505,124** units sold.  
**Average price per bag**: **$3.83**

### Average Store Sales
- Daily sales: $5314
- Daily sold quantity: 1,388 bags
- Monthly sales: $161201 

### Average Transaction
- $7.3 per transaction
- 1.9 bags per transaction
- 182.4g size on average
## **Task 1**

### Total Sales by Month
December shows the highest chip sales, likely due to increased holiday gatherings and celebrations (Christmas, New Year). This period presents a prime opportunity for targeted promotions. 

![sales:month](https://github.com/user-attachments/assets/1036d512-97f3-47dc-b87b-bd8716b70f79)

### Total Sales by Chip Brand and Size

Kettle is the leading chip brand, contributing 20% of total sales. 
The 175g size is the most popular, accounting for 25.1% of total sales, followed by the 150g size at 15.7%. 

<p align="center">
  <img src="https://github.com/user-attachments/assets/52d84007-0456-4f7f-9ae3-0729822694dd" alt="sales:brand" width="45%" />
  <img src="https://github.com/user-attachments/assets/519fa662-19b3-45ec-b197-ff68806bb179" alt="sales:size" width="45%" />
</p>

### Total Sales by Premium Type and Lifestage
Mainstream customers dominate purchasing behavior, accounting for 38.8% of total sales, followed by Budget at 35% and Premium at 26.2%. 

Among the lifestage groups, Older Singles/Couples lead with 20.8% of total sales, followed by Retirees at 18.9% and Older Families at 18.3%. 
Midage Singles/Couples and New Families show weaker performance, contributing 9.6% and 2.6%, respectively.

<p align="center">
  <img src="https://github.com/user-attachments/assets/6858770b-b14c-4adc-bcb6-750bb4310217" alt="sales:pre2" width="45%" />
  <img src="https://github.com/user-attachments/assets/2f101bb9-cf6e-4298-aa1d-99f84007a106" alt="sales:life2" width="45%" />
</p>

## Strategic Recommendations
1. Maximize December sales with holiday-themed promotions and limited-edition flavors. Implement a February recovery plan with attractive discounts.
2. Expand shelf space and promotions for top brands. Highlight mid-range brands in gourmet sections. Reevaluate or replace underperforming brands.
3. Prioritize stocking and promoting 175g and 150g sizes. Offer bulk discounts on larger sizes during events and holidays. Reevaluate or strategically promote lower-performing sizes.
4. Target older demographics with premium and health-focused options. Promote family-size packs for young families. Introduce trendy flavors for young singles/couples. Develop targeted strategies for each lifestage segment.
5. Focus on quality-at-reasonable-price promotions for mainstream customers. Offer discounts and multi-buy deals for budget customers. Emphasize quality and exclusivity for premium customers.
   
## **RFM Segmentation Overview**
RFM (Recency, Frequency, Monetary) analysis was conducted to segment customers based on their purchasing behaviors. 
Customers were scored on a 1- 5 scale across the three dimensions — Recency, Frequency, and Monetary — resulting in the identification of seven customer segments. .

<p align="center">
  <img src="https://github.com/user-attachments/assets/4b8160aa-af56-4086-8f33-4ae6ab972746" alt="seg:life" width="45%" />
  <img src="https://github.com/user-attachments/assets/51bb261c-0659-4295-b29f-3e4ad53f1c92" alt="seg:pre" width="45%" />
</p>

## Strategic Recommendations
1. Sustain and grow high-value segments:
    - Offer value packs and family-sized options for Older and Young Families
    - Focus on premium offerings and personalized loyalty programs for Older Singles/Couples and Retirees
2. Re-engage at-risk and inactive segments:
    - Implement personalized reactivation campaigns for Young Singles/Couples and Retirees
    - Introduce affordable, health-conscious products for Older Singles/Couples 
3. Tailor strategies by premium type:
    - Focus on retaining Mainstream customers with consistent quality and loyalty programs
    - Expand engagement with Budget customers through value-driven promotions
    - Nurture the Premium segment with exclusive offerings and personalized marketing

## **Task 2**
Julia asked us to evaluate the performance of a store trial conducted in stores 77, 86, and 88. The analysis focuses on the following key metrics:

1. Total Sales Revenue
2. Total Number of Customers
3. Average Number of Transactions per Customer

### Methodology
We used Pearson correlations and normalized magnitude distance to assess store performance, generating a combined score. Hypothesis testing was then applied to determine if there were significant differences in the performance of the control stores (those with the highest scores) compared to the trial stores.

### Control and Trial Store Pairs
The control and trial store pairs are as follows:
- Store 77 and Store 233
- Store 86 and Store 155
- Store 88 and Store 40

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
