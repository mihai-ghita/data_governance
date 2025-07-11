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

1. Data Executive
2. Data Owners
3. Data Stewards
4. Data Users

# Data Management

Data Management covers all aspects of an organization’s data and how that data is captured, stored, transformed, transported, delivered, used, and deleted.

# Data Governance Deep Dive

## 1. Data Catalog


## 2. Data Quality

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

### Scoring

Posibile implementations:
1. Option 1
2. Option 2
3. Option 3

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