# Run pytest with 4 threads
```
[tool.pytest.ini_options]
addopts="-n 4"
```

# Test files which do not work
```
test_device_backend.py
test_performance.py
```

# Show rocm version
```
apt show rocm-libs -a
```
