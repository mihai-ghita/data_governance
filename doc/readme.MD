# Data Governance

Data governance is a comprehensive approach that comprises the principles, practices and tools to manage an organization’s data assets throughout their lifecycle.

Data governance is necessary to assure that data is safe, secure, private, usable, and in compliance with both internal and external data policies. Data governance allows setting and enforcing controls that allow greater access to data, gaining the security and privacy from the controls on data.

## Why Data Governance Matters
- Risk Mitigation: Prevents data breaches and compliance violations
- Better Decision Making: Ensures leaders can trust the data they're using
- Operational Efficiency: Reduces time spent fixing data issues
- Regulatory Compliance: Meets legal and industry requirements
- Cost Savings: Prevents expensive data quality problems

## Key Components

1. Data Quality Management
- Ensuring data is accurate, complete, and consistent
- Implementing validation rules and data cleansing processes
- Monitoring data quality metrics

2. Data security
- Protecting sensitive information (PII, financial data, etc.)
- Implementing access controls and encryption
- Ensuring compliance with regulations like GDPR, CCPA, HIPAA

3. Data classification
- Organizing and categorizing data assets
- Creating metadata and documentation

4. Data lineage
- providing an end-to-end view of how data flows across organization

5. Data discovery
- Making data discoverable across the organization

6. Data sharing and collaboration 
-  the organization has the capability to exchange data with internal teams or external parteners 

7. Data cataloging
- it provides a centralized metadata repository for an organization’s data assets

8. Auditing data entitlements and access
- by understanding who has access to what data and tracking recent access, organizations can proactively identify overentitled users or groups and adjust their access accordingly, minimizing the risk of data misuse

## Roles

In **Data Governance**, there are 4 main roles, each with specific responsibilities and purposes:

### 1. Data Executive

**Purpose**: Strategic leadership and overall vision
- Establishes the overall data governance strategy at the organizational level
- Approves data policies and standards
- Ensures funding and resources for governance initiatives
- Responsible for regulatory compliance (GDPR, HIPAA, etc.)
- Communicates data value to senior management

### 2. Data Owners

**Purpose**: Responsibility and authority over specific data domains
- Hold business responsibility for certain datasets
- Define access and usage policies for data in their domain
- Approve major changes to data structure
- Make decisions about data quality and standards in their domain
- Collaborate with technical teams to implement business requirements

### 3. Data Stewards

**Purpose**: Operational implementation and data quality maintenance
- Implement and monitor policies established by Data Owners
- Manage daily data quality (validations, cleansing, profiling)
- Create and maintain documentation and metadata
- Resolve data quality issues
- Facilitate data access for users
- Create and manage **Glossary Terms** and data classification
- Monitor compliance with business rules

### 4. Data Users

**Purpose**: Responsible and efficient data consumption
- Use data according to established policies
- Report quality issues or inconsistencies
- Comply with access and security rules
- Contribute to documentation improvement through feedback
- Participate in data validation processes

### Role Relationships

```
Data Executive
    ↓ (establishes strategy)
Data Owners  
    ↓ (define policies)
Data Stewards
    ↓ (implement and monitor)
Data Users
    ↑ (feedback and issue reporting)
```

### Practical Examples in Project Context

#### For Data Quality Management:
- **Data Executive**: Approves budget for data quality tools (DBT, Great Expectations)
- **Data Owners**: Define what "quality" means for their data (e.g., 95% completeness)
- **Data Stewards**: Implement validation rules and monitor quality scores
- **Data Users**: Report when data appears incorrect in Grafana dashboards

#### For Data Catalog:
- **Data Executive**: Approves OpenMetadata implementation
- **Data Owners**: Define data classification and sensitivity
- **Data Stewards**: Create Glossary Terms, add metadata and labels
- **Data Users**: Search and discover data through catalog

#### For Compliance:
- **Data Executive**: Ensures GDPR compliance
- **Data Owners**: Identify PII data in their domain
- **Data Stewards**: Implement PII labeling and access controls
- **Data Users**: Comply with sensitive data access restrictions

#### For Data Security:
- **Data Executive**: Defines enterprise security policies and approves security budget for encryption tools and access management systems
- **Data Owners**: Classify data sensitivity levels (Public, Internal, Confidential, Restricted) and define who can access customer financial data
- **Data Stewards**: Implement row-level security in PostgreSQL, configure OpenMetadata access controls, and monitor failed access attempts through audit logs
- **Data Users**: Use VPN connections, follow password policies, and report suspicious data access attempts

#### For Data Sharing and Collaboration:
- **Data Executive**: Approves data sharing agreements with external partners and establishes cross-departmental data sharing policies
- **Data Owners**: Define which datasets can be shared between departments (e.g., Marketing can access customer demographics but not payment details)
- **Data Stewards**: Set up secure data APIs, create shared views in PostgreSQL, configure OpenMetadata to show available datasets for sharing, and manage data export permissions
- **Data Users**: Request access to shared datasets through proper channels, use shared Grafana dashboards for collaborative analysis, and follow data sharing protocols when working with external teams

These roles work together to ensure organizational data is **secure**, **high-quality**, **accessible**, and **compliant** with regulations.

# Data Management

Data Management covers all aspects of an organization’s data and how that data is captured, stored, transformed, transported, delivered, used, and deleted.

# Data Governance Deep Dive

## 1. Data Catalog

A **Data Catalog** is a centralized metadata repository that provides a comprehensive inventory of an organization's data assets. 
Think of it as a "library catalog" for data - it helps users discover, understand, and effectively use data across the organization.

### Key Components of a Data Catalog

#### 1. **Metadata Management**
- **Technical Metadata**: Schema definitions, data types, table structures, column descriptions
- **Business Metadata**: Business definitions, data ownership, usage context
- **Operational Metadata**: Data lineage, refresh schedules, quality metrics, usage statistics

#### 2. **Data Discovery & Search**
- Search functionality to find datasets by name, description, tags, or content
- Browse capabilities by department, domain, or data source
- Recommendation engines suggesting relevant datasets

#### 3. **Data Lineage**
- Visual representation of how data flows through systems
- Upstream and downstream dependencies
- Impact analysis for changes

#### 4. **Data Quality Information**
- Quality scores and metrics
- Data profiling results
- Validation rules and their status

### Why Data Catalogs Matter

#### **For Data Users**
- **Faster Data Discovery**: Quickly find relevant datasets without asking around
- **Better Understanding**: Access to business context and documentation
- **Trust & Confidence**: Quality metrics help assess data reliability

#### **For Data Teams**
- **Reduced Redundancy**: Avoid creating duplicate datasets
- **Impact Analysis**: Understand downstream effects of changes
- **Compliance**: Track sensitive data and access patterns

#### **For Organizations**
- **Data Democratization**: Make data accessible to more users
- **Regulatory Compliance**: Track data usage and lineage for audits
- **Cost Optimization**: Identify unused or redundant data assets

### Modern Data Catalog Features

1. **Automated Discovery**: Automatically scan and catalog new data sources
2. **Collaborative Features**: User ratings, comments, and crowdsourced documentation
3. **Integration**: Connect with BI tools, data pipelines, and governance platforms
4. **Access Control**: Integration with security systems for data access management
5. **Data Classification**: Automatic tagging of sensitive data (PII, financial, etc.)

### Popular Data Catalog Tools

- **Cloud Native**: AWS Glue Data Catalog, Google Cloud Data Catalog, Azure Purview
- **Enterprise**: DataHub
- **Open Source**: Apache Atlas, DataHub, OpenMetadata

A well-implemented data catalog transforms data from a scattered, hard-to-find resource into an organized, discoverable, and trustworthy asset that drives better decision-making across the organization.

**Data Labeling** (also known as Data Tagging or Data Classification) is the process of assigning descriptive metadata tags or labels to data assets to categorize, organize, and provide context about the data. These labels help users understand what the data contains, how it should be handled, and what restrictions or policies apply to it.

### Types of Data Labels

#### 1. **Sensitivity Labels**
- **Public**: Data that can be freely shared
- **Internal**: Data for internal use only
- **Confidential**: Sensitive business information
- **Restricted**: Highly sensitive data (Sensitive, PII, financial, health records)

#### 2. **Data Classification Labels**
- **Personal Data**: Contains personally identifiable information (PII)
- **Financial Data**: Contains financial information
- **Health Data**: Contains protected health information (PHI)
- **Intellectual Property**: Contains proprietary information

#### 3. **Quality Labels**
- **High Quality**: Data meets all quality standards
- **Medium Quality**: Data has minor quality issues
- **Low Quality**: Data has significant quality issues
- **Unverified**: Data quality hasn't been assessed

#### 4. **Lifecycle Labels**
- **Active**: Currently used data
- **Archived**: Historical data kept for compliance
- **Deprecated**: Data no longer recommended for use
- **Scheduled for Deletion**: Data marked for removal

### Best Practices for Data Labeling

#### 1. **Establish a Consistent Taxonomy**
- Create a standardized vocabulary of labels
- Define clear criteria for each label
- Ensure labels are mutually exclusive where appropriate
- Use hierarchical labeling (e.g., PII > Sensitive >  > Public)

#### 2. **Automate Where Possible**
- Use data discovery tools to automatically detect patterns
- Implement regex patterns for common data types (emails, SSNs, credit cards)
- Use machine learning for content-based classification
- Set up rules-based classification for structured data

#### 3. **Implement Multi-Level Labeling**
- Column-level labels: Individual field classifications
- Table-level labels: Overall dataset classification
- Database-level labels: System-wide classifications

#### 4. **Ensure Governance and Compliance**
- Align labels with regulatory requirements (GDPR, HIPAA, SOX)
- Define retention policies for each label type
- Implement access controls based on labels
- Create audit trails for label changes

#### 5. **Regular Review and Maintenance**
- Schedule periodic label reviews
- Update labels when data content changes
- Validate automated labeling accuracy
- Train users on proper labeling practices


### 5. **Make Labels Actionable**

Labels can serve as **triggers for automated actions** because they provide machine-readable metadata that systems can interpret and act upon. 
Steps:
- Link labels to specific policies and procedures
- Automate security controls based on labels
- Use labels to drive data lifecycle management
- Enable self-service data discovery through labels


## 3. Data Quality - JUnit for data

### Dimensions
- Completeness

Data is considered “complete” when it fulfills expectations of comprehensiveness. Let’s say that you ask the customer to supply his or her name. You might make a customer’s middle name optional, but as long as you have the first and last name, the data is considered to be complete. If, on the other hand, you have a database of prospective customers who registered on your website using a fake phone number such as (111) 111-1111, then you’re missing some important information that could be useful.

- Consistency 

At many companies, the same information may be stored in more than one place. If that information matches, it’s considered to be “consistent.” For example, if your human resources information systems say an employee doesn’t work for your company anymore, yet your payroll says he’s still receiving a check, that’s inconsistent. 

- Uniqueness

“Unique” means that there’s only one instance of it appearing in a database. Data duplication is a frequent occurrence. “Daniel A. Robertson” and “Dan A. Robertson” may well be the same person. 

- Validity

Validity is a data quality dimension that refers to information that doesn’t conform to a specific format or doesn’t follow business rules. A popular example is birthdays – many systems ask you to enter your birthday in a specific format, and if you don’t, it’s invalid. Address information, likewise, must conform to a set of rules or it will be invalid. US zip codes are at least a 5-digit numeric string but sometimes may include a four-digit appendix. Each country has its own rules governing the validity of postal codes.

- Timeliness

Is your information available right when it’s needed? That data quality dimension is called “timeliness.” Let’s say that you need financial information every quarter; if the data is ready when it’s supposed to be, it’s timely. There are other cases when timeliness can be even more important.  If you’re using data analytics for fraud detection, for example, you’ll want access to real-time data (or at least very close to real-time).

- Accuracy

The term “accuracy” refers to the degree to which information correctly reflects an event, location, person, or other entity. For example, if a customer’s street address is correct, but the postal code does not match, then the data lacks accuracy. 


### Rules and Validations

Business Rules:
- Format Rules: Email addresses, phone numbers, postal codes
- Range Rules: Age between 0-120, salary within reasonable bounds
- Logical Rules: End date after start date, quantity > 0 for sales
- Cross-field Rules: Consistency between related fields

### Data profiling

Data profiling typically involves three main types of analysis:
1. Column Profiling (Structure Analysis)
- Data types and formats
- Null value counts (completeness assessment)
- Unique value counts (uniqueness assessment)
- Min/max values and ranges
- Pattern analysis (format validation)
2. Cross-Column Profiling (Relationship Analysis)
- Dependencies between fields
- Correlations and relationships
- Consistency checks across related columns
- Business rule validation
3. Cross-Table Profiling (Data Integration Analysis)
- Referential integrity between tables
- Data lineage mapping
- Consistency across data sources

### Architecture 

![](/images/data_quality_archicture.png )

### Data Quality Index (DQI)

A **Data Quality Index** is a composite metric that aggregates multiple data quality dimensions into a single score, providing an overall assessment of dataset quality. 

**Benefits of DQI**

- **Single Metric**: Easy to communicate quality status
- **Trend Analysis**: Track quality improvements/degradations over time
- **Prioritization**: Focus efforts on lowest-scoring datasets
- **SLA Monitoring**: Set quality SLAs based on DQI thresholds
- **Automated Actions**: Trigger workflows based on DQI scores

Here's how to define and implement one:

#### **1. Define Quality Dimensions and Weights**

Each dimension contributes to the overall DQI with specific weights based on business importance:

```sql
-- Example dimension weights (must sum to 100%)
Completeness: 25%     -- Missing values impact
Accuracy: 20%         -- Correctness of data
Consistency: 15%      -- Internal consistency
Validity: 15%         -- Format compliance
Uniqueness: 15%       -- Duplicate detection
Timeliness: 10%       -- Data freshness
```

#### **2. Calculate Individual Dimension Scores**

Each dimension is scored from 0-100:

```sql
-- Completeness Score
completeness_score = (total_non_null_values / total_values) * 100

-- Completeness Score for Multiple Columns

-- Method 1: Overall Completeness (all columns equally weighted)
completeness_score = (total_non_null_values_all_columns / total_possible_values_all_columns) * 100

-- Method 2: Average Column Completeness
completeness_score = AVG(column_completeness_scores) 
-- where column_completeness_scores = (non_null_count / total_rows) * 100 for each column

-- Method 3: Weighted Column Completeness (business-critical columns have higher weight)
completeness_score = SUM(column_completeness_score * column_weight)
-- where SUM(column_weights) = 100%

-- Method 4: Record-Level Completeness (percentage of records with all required fields)
completeness_score = (records_with_all_required_fields / total_records) * 100

-- Accuracy Score (based on validation rules passed)
accuracy_score = (records_passing_accuracy_rules / total_records) * 100

-- Consistency Score (cross-field validation)
consistency_score = (consistent_records / total_records) * 100

-- Validity Score (format validation)
validity_score = (records_with_valid_format / total_records) * 100

-- Uniqueness Score
uniqueness_score = ((total_records - duplicate_records) / total_records) * 100

-- Timeliness Score (based on data age)
timeliness_score = CASE 
    WHEN data_age_hours <= 24 THEN 100
    WHEN data_age_hours <= 72 THEN 80
    WHEN data_age_hours <= 168 THEN 60
    ELSE 40
END
```

#### **3. DQI Calculation Formula**

```sql
DQI = (completeness_score * 0.25) + 
      (accuracy_score * 0.20) + 
      (consistency_score * 0.15) + 
      (validity_score * 0.15) + 
      (uniqueness_score * 0.15) + 
      (timeliness_score * 0.10)
```

#### **4. DQI Implementation Options**

**Option 1: Simple Weighted Average**
- Equal weight for critical dimensions
- Easy to understand and implement
- Good for general-purpose scoring

**Option 2: Business-Critical Weighted**
- Higher weights for business-critical dimensions
- Customizable per dataset type
- Reflects actual business impact

**Option 3: Threshold-Based Scoring**
- Minimum thresholds for each dimension
- Penalty for dimensions below threshold
- Ensures no single dimension failure

#### **5. DQI Categories and Actions**

```sql
-- DQI Score Interpretation
CASE 
    WHEN DQI >= 90 THEN 'Excellent' -- Green: Production ready
    WHEN DQI >= 80 THEN 'Good'      -- Yellow: Minor issues
    WHEN DQI >= 70 THEN 'Fair'      -- Orange: Needs attention
    WHEN DQI >= 60 THEN 'Poor'      -- Red: Requires immediate action
    ELSE 'Critical'                 -- Critical: Block usage
END
```

#### **6. DQI Customization by Dataset Type**

Different dataset types may need different dimension weights:

```sql
-- Transactional Data: High accuracy and completeness focus
-- Master Data: High consistency and uniqueness focus  
-- Analytical Data: High timeliness and validity focus
-- Reference Data: High accuracy and consistency focus
```

#### **7. Detailed Completeness Calculation Examples**

Here are practical SQL implementations for calculating completeness across multiple columns:

```sql
-- Example: Customer table with multiple columns
-- Columns: customer_id, first_name, last_name, email, phone, address, city, country

-- Method 1: Overall Completeness (Simple Count)
WITH completeness_metrics AS (
    SELECT 
        COUNT(*) as total_records,
        COUNT(*) * 8 as total_possible_values, -- 8 columns
        (COUNT(customer_id) + COUNT(first_name) + COUNT(last_name) + 
         COUNT(email) + COUNT(phone) + COUNT(address) + 
         COUNT(city) + COUNT(country)) as total_non_null_values
    FROM customers
)
SELECT 
    (total_non_null_values * 100.0 / total_possible_values) as overall_completeness_score
FROM completeness_metrics;

-- Method 2: Average Column Completeness
WITH column_completeness AS (
    SELECT 
        COUNT(*) as total_records,
        (COUNT(customer_id) * 100.0 / COUNT(*)) as customer_id_completeness,
        (COUNT(first_name) * 100.0 / COUNT(*)) as first_name_completeness,
        (COUNT(last_name) * 100.0 / COUNT(*)) as last_name_completeness,
        (COUNT(email) * 100.0 / COUNT(*)) as email_completeness,
        (COUNT(phone) * 100.0 / COUNT(*)) as phone_completeness,
        (COUNT(address) * 100.0 / COUNT(*)) as address_completeness,
        (COUNT(city) * 100.0 / COUNT(*)) as city_completeness,
        (COUNT(country) * 100.0 / COUNT(*)) as country_completeness
    FROM customers
)
SELECT 
    (customer_id_completeness + first_name_completeness + last_name_completeness + 
     email_completeness + phone_completeness + address_completeness + 
     city_completeness + country_completeness) / 8 as avg_completeness_score
FROM column_completeness;

-- Method 3: Weighted Column Completeness (Business Priority)
WITH weighted_completeness AS (
    SELECT 
        COUNT(*) as total_records,
        (COUNT(customer_id) * 100.0 / COUNT(*)) as customer_id_completeness,
        (COUNT(first_name) * 100.0 / COUNT(*)) as first_name_completeness,
        (COUNT(last_name) * 100.0 / COUNT(*)) as last_name_completeness,
        (COUNT(email) * 100.0 / COUNT(*)) as email_completeness,
        (COUNT(phone) * 100.0 / COUNT(*)) as phone_completeness,
        (COUNT(address) * 100.0 / COUNT(*)) as address_completeness,
        (COUNT(city) * 100.0 / COUNT(*)) as city_completeness,
        (COUNT(country) * 100.0 / COUNT(*)) as country_completeness
    FROM customers
)
SELECT 
    -- Weights: critical fields get higher weights
    (customer_id_completeness * 0.20 +     -- 20% - Primary key (critical)
     first_name_completeness * 0.15 +      -- 15% - Important for communication
     last_name_completeness * 0.15 +       -- 15% - Important for communication
     email_completeness * 0.20 +           -- 20% - Critical for marketing
     phone_completeness * 0.10 +           -- 10% - Secondary contact
     address_completeness * 0.08 +         -- 8% - Nice to have
     city_completeness * 0.07 +            -- 7% - Geographic analysis
     country_completeness * 0.05           -- 5% - Less critical
    ) as weighted_completeness_score
FROM weighted_completeness;

-- Method 4: Record-Level Completeness (All Required Fields Present)
WITH record_completeness AS (
    SELECT 
        COUNT(*) as total_records,
        COUNT(CASE 
            WHEN customer_id IS NOT NULL 
                AND first_name IS NOT NULL 
                AND last_name IS NOT NULL 
                AND email IS NOT NULL 
            THEN 1 
        END) as complete_records
    FROM customers
)
SELECT 
    (complete_records * 100.0 / total_records) as record_level_completeness_score
FROM record_completeness;

-- Method 5: Tiered Completeness (Different levels of completeness)
WITH tiered_completeness AS (
    SELECT 
        COUNT(*) as total_records,
        -- Tier 1: Essential fields only
        COUNT(CASE 
            WHEN customer_id IS NOT NULL AND email IS NOT NULL 
            THEN 1 
        END) as tier1_complete,
        -- Tier 2: Essential + important fields
        COUNT(CASE 
            WHEN customer_id IS NOT NULL AND email IS NOT NULL 
                AND first_name IS NOT NULL AND last_name IS NOT NULL 
            THEN 1 
        END) as tier2_complete,
        -- Tier 3: All fields
        COUNT(CASE 
            WHEN customer_id IS NOT NULL AND email IS NOT NULL 
                AND first_name IS NOT NULL AND last_name IS NOT NULL 
                AND phone IS NOT NULL AND address IS NOT NULL 
                AND city IS NOT NULL AND country IS NOT NULL 
            THEN 1 
        END) as tier3_complete
    FROM customers
)
SELECT 
    (tier1_complete * 100.0 / total_records) as tier1_completeness,
    (tier2_complete * 100.0 / total_records) as tier2_completeness,
    (tier3_complete * 100.0 / total_records) as tier3_completeness,
    -- Weighted average of tiers
    ((tier1_complete * 0.5) + (tier2_complete * 0.3) + (tier3_complete * 0.2)) * 100.0 / total_records as tiered_completeness_score
FROM tiered_completeness;
```
Choosing the Right Method**

- **Method 1 (Overall)**: Use when all columns are equally important
- **Method 2 (Average)**: Use for balanced view across all columns
- **Method 3 (Weighted)**: Use when columns have different business importance
- **Method 4 (Record-Level)**: Use when you need complete records for analysis
- **Method 5 (Tiered)**: Use when you have different levels of data requirements

This approach provides a standardized, measurable way to assess and monitor data quality across your organization.

### Implementation

1. Calculating data quality metrics for all datasets 
2. Implement scoring
3. Implementing validation rules based on profiling discoveries
4. Choose a scoring
5. Building dashboards to visualize profiling results
6. Monitoring data quality metrics over time


### Tools

1. DBT
2. AWS Deequ
3. Great Expectation

# Exercises

1. Based on the given schema, define and calculate data quality metric( business rules, 6 dimensions )
    1. Sample data in Postgres
2. Create a dashboard in Grafana that shows the current data quality status
3. Based on the data quality metrics calculate data quality scoring 
4. Update the dashboard and with the data quality scoring
5. Run the data catalog on local machine
6. Enhance the data catalog with labels based on the data quality metrics



Summary
1. Data Governance
    1. Ce este?
    2. De ce?
    3. Componente
    4. Roluri
2. Data Catalog
    1. Ce este?
    2. Ce componente are? Care este legatura intre componente si rolurile definite de Data Governance?
    3. Data labeling
    4. Install OpenMetadata
        1. Add a database
        2. Check Tabels and columns

3. Data Quality
    1. Ce este?
    2. Care sunt cele 6 dimensiuni?
    3. Business Rules
    4. Data Quality Index 
    5. Data Quality Architecture
    6. Cum este implementat Data Quality in OpenMetadata
    7. Hai sa implementam cateva reguli in DBT
        1. fiecare trebuie sa implementeze pe 2 tabele, 2 requli + 2 reguli cross-columns, cross-tabels
        2. rezultatul trebuie agregat intr-o tabela si  calculat DQI
    8. Cream un dashboard in Grafana ce afiseaza evolutia DQI-ului per tabela