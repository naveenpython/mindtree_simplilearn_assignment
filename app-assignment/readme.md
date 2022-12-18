# A simple, minimal Maven example: hello world

To create the files in this git repo we've already run `mvn archetype:generate` from http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html

    mvn archetype:generate -DgroupId=com.myorg.tool -DartifactId=my-tool -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

Now, to print "Hello World!", type either...

    cd my-tool
    mvn compile
    java -cp target/classes com.myorg.tool.Tool

or...

    cd my-tool
    mvn package
    java -cp target/my-tool-1.0-SNAPSHOT.jar com.myorg.tool.Tool

Running `mvn clean` will get us back to only the source Java and the `pom.xml`:

    murphy:my-tool pdurbin$ mvn clean --quiet
    murphy:my-tool pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/myorg/tool/Tool.java
    src/test/java/com/myorg/tool/ToolTest.java

Running `mvn compile` produces a class file:

    murphy:my-tool pdurbin$ mvn compile --quiet
    murphy:my-tool pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/myorg/tool/Tool.java
    src/test/java/com/myorg/tool/ToolTest.java
    target/classes/com/myorg/tool/Tool.class
    murphy:my-tool pdurbin$ 
    murphy:my-tool pdurbin$ java -cp target/classes com.myorg.tool.Tool
    Hello World!

Running `mvn package` does a compile and creates the target directory, including a jar:

    murphy:my-tool pdurbin$ mvn clean --quiet
    murphy:my-tool pdurbin$ mvn package > /dev/null
    murphy:my-tool pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/myorg/tool/Tool.java
    src/test/java/com/myorg/tool/ToolTest.java
    target/classes/com/myorg/tool/Tool.class
    target/maven-archiver/pom.properties
    target/my-tool-1.0-SNAPSHOT.jar
    target/surefire-reports/com.myorg.tool.ToolTest.txt
    target/surefire-reports/TEST-com.myorg.tool.ToolTest.xml
    target/test-classes/com/myorg/tool/ToolTest.class
    murphy:my-tool pdurbin$ 
    murphy:my-tool pdurbin$ java -cp target/my-tool-1.0-SNAPSHOT.jar com.myorg.tool.Tool
    Hello World!

Running `mvn clean compile exec:java` requires http://mojo.codehaus.org/exec-maven-plugin/

Running `java -jar target/my-tool-1.0-SNAPSHOT.jar` requires http://maven.apache.org/plugins/maven-shade-plugin/
