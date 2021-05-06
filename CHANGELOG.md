# Changelog

## [2.0.0](https://github.com/extra2000/grafana-formula/compare/v1.1.0...v2.0.0) (2021-05-06)


### ⚠ BREAKING CHANGES

* Naming scheme for pod and volume have changed to prevent conflicts with other deployments.

### Features

* Prefix pod and volume name with `projectname` to prevent conflict with other projects that are using the same container name ([533f8c0](https://github.com/extra2000/grafana-formula/commit/533f8c0618cf82854221568fcb197948a16bb31d))

## [1.1.0](https://github.com/extra2000/grafana-formula/compare/v1.0.0...v1.1.0) (2021-05-06)


### Features

* **config.files:** Add support for rootful Podman ([f091c7b](https://github.com/extra2000/grafana-formula/commit/f091c7b79b6bd7b7761b6d0ee72875d488102683))


### Code Refactoring

* **salt:** Add mapping YAML files as template ([dc36316](https://github.com/extra2000/grafana-formula/commit/dc3631631f0d05683e8000921a2a32e1da641860))


### Fixes

* **defaults.yaml, pillar.example:** Use `cni-podman1` instead of `cni-podman0` to prevent conflict with rootful containers ([8d25bdb](https://github.com/extra2000/grafana-formula/commit/8d25bdbfd209e1e059e136a86e6f4b53c9048b4e))
* **service.redis.destroy:** Fix typo ([267b514](https://github.com/extra2000/grafana-formula/commit/267b5149617ec7c9cc497b5d91a177eb5c41c2ed))

## 1.0.0 (2021-04-30)


### Features

* **salt:** Add implementations for states in `grafana/` ([b6e175d](https://github.com/extra2000/grafana-formula/commit/b6e175d2f213d44b45f738f2e1affde9fc04e6d0))


### Continuous Integrations

* Add AppVeyor with `semantic-release` bot ([471bf42](https://github.com/extra2000/grafana-formula/commit/471bf42c82da5359cb9c3cd6eb71bc659177a2b8))


### Documentations

* **pillar:** Add `pillar.example` ([92b84ae](https://github.com/extra2000/grafana-formula/commit/92b84aee9170aa547ada3556c77b87582dafaa45))
* **README:** Update `README.md` ([c5099ac](https://github.com/extra2000/grafana-formula/commit/c5099ace0fe776c5feaf22bb4552513ab4ada1cc))
