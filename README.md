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

For launch frontend extensions, use an extension schema instead of the base schema.
For example, `ros_gz_bridge` launch files can use:

```xml
<?xml version="1.0"?>
<?xml-model href="https://nobleo.github.io/ros2_launch_validation/ros2_launch_ros_gz_bridge.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>

<launch>
```

### Command-line validation

Validate the launchfiles in your package:

```bash
xmllint --noout --schema <(curl -s https://nobleo.github.io/ros2_launch_validation/ros2_launch.xsd) **/*.launch.xml
```

### Use with pre-commit:
To validate XML schema's automatically, add this to your `.pre-commit-config.yaml`:

```yaml
  - repo: https://github.com/nobleo/nobleo-pre-commit
    rev: 26.6.1
    hooks:
      - id: launch-depends
      - id: xml-schema
```

## Credits

<!-- markdownlint-disable MD033 -->
<img src="https://nobleo-technology.nl/wp-content/uploads/2024/08/Nobleo_BG-paars_logo-wit-small.jpg" alt="Nobleo Logo" width="300"/>
<!-- markdownlint-enable MD033 -->

This schema is developed by Nobleo Autonomous Solutions B.V.

Looking for paid support options? Contact us at [nobleo-technology.nl](https://nobleo-technology.nl).
