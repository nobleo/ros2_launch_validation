# ROS2 Launch File Validation

## Why

XSD schema for validating ROS2 XML launch files.
Catch syntax errors before runtime and get IDE support.

## How

### Embed in launch file

Start your launchfile like this:

```xml
<?xml version="1.0"?>
<?xml-model href="https://raw.githubusercontent.com/nobleo/ros2_launch_validation/main/ros2_launch.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>

<launch>
```

### Command-line validation

Validate the launchfiles in your package:

```bash
wget -O ros2_launch.xsd https://raw.githubusercontent.com/nobleo/ros2_launch_validation/main/ros2_launch.xsd
xmllint --noout --schema ros2_launch.xsd **/*.launch.xml
```
