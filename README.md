# check-reboot
## Description
detect reboot.

## Usage
```
usage: check-reboot [options]
    Description:
        Detect reboot.

    Options:
        -h  show help
        -w  set alert level WARNING (exit status 1). (default: not selected)
        -c  set alert level CRITICAL (exit status 2). (default: selected)
```

## Example

Example settings for mackerel agent conf.

```
[plugin.checks.check_reboot]
command = "/opt/mackerel-agent/plugins/bin/check-reboot -w"
timeout_seconds = 45
```

Recommend setting `timeout_seconds` longer than 30sec (default value is 30sec).
check-reboot uses mkr command and mkr timeout is 30sec (unchangeable), So check-reboot may take longer than 30sec.

## License
Copyright 2018 KAYAC Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
