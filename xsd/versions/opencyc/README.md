OpenCyc API-compatible XSDs
---------------------------

These Cyc XSDs allow older (pre-BaseClient) code to compile. They closely reflect the state of 
the XSDs from approximately 2013-08, well before the OpenCyc API -> BaseClient refactoring. 

In particular, `cycml.xsd` specifies a JAXB package which was originally `org.opencyc.xml.cycml`, 
but which has been changed to `com.cyc.baseclient.xml.cycml`. 

The `schemaLocation` attributes for the XSDs in this directory assume that other Cyc XSDs are 
available under <http://dev.cyc.com/xsd/versions/opencyc/>

* [Cyc Concepts](cycconcepts.xsd)

    XML schema for Cyc concepts.

* [Cyc ML](cycml.xsd)

    XML schema for CycL terms, including constants, formulas, assertions, etc.

* [CycL Query](cyclquery.xsd)

    XML schema for CycL query specifications, including query sentence, microtheory, and inference 
    parameters.

* [Formula Template](formulatemplate.xsd)

    XML schema for formula templates. Used for loading CycL query specifications from a Cyc image.

* [Lightweight Result Set](lightweightresultset.xsd)

     XML schema for minimal result sets used for autocomplete and simple query results.

* [Proof View](proofview.xsd)

     XML schema for proof-views, a natural-language justification format.

* [Text Processing](textprocessing.xsd)

     XML schema for text processing results.

