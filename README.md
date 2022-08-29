Workout App
> this application was designed to help generate new workout ideas for those who may be stuck doing the same old workouts each day.

Table of Contents
* [General Info]
* [Technologies Used]
* [Features]
* [Setup]
* [Project Status]
* [Room for Improvement]
* [Contact]



General Information
- This projected was created with the idea to help clients grow and expand their workout list.
- The focus is to solve the blockade of repeating the same workouts week after week.
- By adding fresh new workout ideas users can now have a wide varitey of workouts to choose from.
- As a avide fitness person I have constitaly had this problem personaly and know many people who have had it as well.



Technologies Used
- Java
- SpringBoot Suite
- MySQL


Features
- Anyone can access the application and view all workouts posted.
- Clients can create a private account backed with password security, to allow them the ability to add new workouts, as well as like/comment on others.
- Users can upload images or videos demonstrating the workout.

Setup

Here is a list of all the depenedices needed for this project:

    <dependencies>
      <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
      </dependency>
      <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
      </dependency>
		
		<!-- Dependencies needed to use jsp files -->
        <dependency>
          <groupId>org.apache.tomcat.embed</groupId>
          <artifactId>tomcat-embed-jasper</artifactId>
        </dependency>

        <dependency>
          <groupId>javax.servlet</groupId>
          <artifactId>jstl</artifactId>
        </dependency>

        <dependency>
          <groupId>org.webjars</groupId>
          <artifactId>webjars-locator</artifactId>
          <version>0.30</version>
        </dependency>

        <!-- BOOTSTRAP DEPENDENCIES -->
        <dependency>
          <groupId>org.webjars</groupId>
          <artifactId>bootstrap</artifactId>
          <version>5.0.1</version>
        </dependency>
        <dependency>
          <groupId>org.webjars</groupId>
          <artifactId>jquery</artifactId>
          <version>3.6.0</version>
        </dependency>

        <dependency>
            <groupId>org.mindrot</groupId>
            <artifactId>jbcrypt</artifactId>
            <version>0.4</version>
        </dependency>
        <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-tomcat</artifactId>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>

You will also need to create a Mysql schema. In the applicaiton.properties file add the following code if not already there:
spring.mvc.view.prefix=/WEB-INF/

spring.datasource.url=jdbc:mysql://localhost:3306/<<your_schema_name>> Make sure to add you schema name!
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update

spring.mvc.hiddenmethod.filter.enabled=true

Project is ran with Spring Boot Suite. Download file and upload them as a new spring starter pack. Add all the depenedencies above into the pom.xml file. Right click and selection run as spring boot app. The application will then be live on http://localhost:8080


Project Status
Project is: In Progress


Room for Improvement
Include areas you believe need improvement / could be improved. Also add TODOs for future development.

Room for improvement:
- Improvement to be done 1
- Improvement to be done 2

To do:
- Feature to be added 1
- Feature to be added 2


Contact
Created by Casey Johnson (https://www.linkedin.com/in/casey-johnson-716773249/) - feel free to contact me!

