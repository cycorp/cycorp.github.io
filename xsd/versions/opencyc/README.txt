These XSDs should allow older (pre-BaseClient) code to compile. They closely reflect the state of 
the XSDs from approximately 2013-08, well before the OpenCyc API -> BaseClient refactoring. 

In particular, cycml.xsd specifies a JAXB package which was originally org.opencyc.xml.cycml, but
which had been changed to com.cyc.baseclient.xml.cycml. 

These XSDs assume that they are available under http://dev.cyc.com/xsd/versions/opencyc/

Additionally, import element schemaLocation attributes have been updated as appropriate/necessary
to point to other XSDs in this directory.

