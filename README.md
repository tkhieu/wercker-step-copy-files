# Copy files step for Wercker

This is a simple build step that copies files from one directory to the other. Existing files are overwritten by default.

## Configuration

* `source`: the directory containing the files to copy.
* `destination`: the directory to which the files should be copied.
* `flags`: optional flags for the `cp` command. *The default is `-R`.*
* `ignore_branches`: a space separated list of branches on which this step should not run. *This step runs on all branches by default.*
* `only_on_branches`: a space separated list of branches on which this step should run. The step will not run on any other branch. This is ignored if `ignore_branches` is set. *This step runs on all branches by default.*

## Versioning

The version number consists of three numbers. A bump in the in the major version (first number) indicates breaking changes. A bump in the second number indicates new features. The third number is increased for bugfixes.

## Example *wercker.yml* file

	box: debian
	build:
	steps:
		- samueldebruyn/copy-files:
			source: staging
			destination: static
			ignore_branches: master

## Contributing and license

This wercker step is licensed under the MIT License. Create a pull request or an issue to contribute.