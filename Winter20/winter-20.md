
Administrator
-------------

Customize Account Teams
- add custom fields, buttons and links to Account Team Layout
- use validation rules, Apex triggers, Process Builder, and Workflow rules with Account Teams
- can report on Account Teams

Customize Opportunity Contact Roles
- attribute revenue to roles, titles, and individuals

Add a Signature to Email Templates
- merge field {{{Sender.Signature}}} 

Increase Limits for Approval Processes
- org: 1,000 active / 2,000 total approval processes
- object 300 active / 500 total approval 

Check a Field's References and Find Report's Using it

Platform App Builder
--------------------
- use Tabs and Accordion components on Home page
- datevalue() bug fix for daylight savings time
- find important email templates quickly (remember last category and folder)
- increase # of custom objecets from 2,500 to 3,000
    - 2,000 defined by the org
    - 1,000 defined by installed managed packages
- run flows on a schedule
    - can update 250,000 records per day
    - 200 records / license
    - which ever is greater
    - check debug logs to see if limit is exceeded.
    - errors including governor limit errors are sent to the last person who updated the flow
- send custom notifications with flow builder
- activate your flow without leaving flow builder

Develop I
---------
- check a field's references and find where it is used
- callouts are excluded from long running request limit 
    - long running is > 5 seconds
    - HTTP callout time is no longer included when calculating the 5 second limit
    - SOAP callouts generated by WSDL2Apex
    - External Services and External Objects
- ApexSettigns
    - enableAggregateCodeCoverageOnly
    - enableDisableParallelApexTesting
    - enableDoNotEmailDebugLog
    - enableGaplessTestAutoNum

Hands on:   Create an LWC custom tab
