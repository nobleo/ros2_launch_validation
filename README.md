# ROS2 Launch File Validation

## Why

XSD schema for validating ROS2 XML launch files.
Catch syntax errors before runtime and get IDE support.

## How

### Embed in launch file

Start your launchfile like this:

```xml
<?xml version="1.0"?>
<?xml-model href="https://nobleo.github.io/ros2_launch_validation/ros2_launch.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>

<launch>
```

### Command-line validation

Validate the launchfiles in your package:

```bash
xmllint --noout --schema <(curl -s https://nobleo.github.io/ros2_launch_validation/ros2_launch.xsd) **/*.launch.xml
```

## Credits

<!-- markdownlint-disable MD033 -->
<img src="https://nobleo-technology.nl/wp-content/uploads/2024/08/Nobleo_BG-paars_logo-wit-small.jpg" alt="Nobleo Logo" width="300"/>
<!-- markdownlint-enable MD033 -->

This schema is developed by Nobleo Autonomous Solutions B.V.

Looking for paid support options? Contact us at [nobleo-technology.nl](https://nobleo-technology.nl).
