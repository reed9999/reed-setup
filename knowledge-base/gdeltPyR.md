- MAIN ATTEMPT

pip3 install -r requirements.txt 



(gdelt-demo) philip@tenofdiamonds:~/code/linwoodc3_gdeltPyR$ pytest
usage: pytest [options] [file_or_dir] [file_or_dir] [...]
pytest: error: unrecognized arguments: --cov --cov-repo=term-missing
  inifile: /home/philip/code/linwoodc3_gdeltPyR/setup.cfg
  rootdir: /home/philip/code/linwoodc3_gdeltPyR


Same if run from test dir.

https://stackoverflow.com/questions/26589990/py-test-error-unrecognized-arguments-cov-ner-brands-cov-report-term-missi


- ATTEMPT
Added pytest-cov to the requirements and reran. 

- RESULT
Still same issue.

- ATTEMPT
Maybe setup tools needs to be updated?

(gdelt-demo) philip@tenofdiamonds:~/code/linwoodc3_gdeltPyR$ easy_install --version
setuptools 40.6.2 from /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (Python 3.6)
(gdelt-demo) philip@tenofdiamonds:~/code/linwoodc3_gdeltPyR$ 

This would suggest the version is not too old.


- ATTEMPT
https://stackoverflow.com/a/53488884
This is the problem. 

(gdelt-demo) philip@tenofdiamonds:~/code/linwoodc3_gdeltPyR$ deactivate 
philip@tenofdiamonds:~/code/linwoodc3_gdeltPyR$ py.test --version
usage: py.test [options] [file_or_dir] [file_or_dir] [...]
py.test: error: unrecognized arguments: --cov --cov-repo=term-missing
  inifile: /home/philip/code/linwoodc3_gdeltPyR/setup.cfg
  rootdir: /home/philip/code/linwoodc3_gdeltPyR
philip@tenofdiamonds:~/code/linwoodc3_gdeltPyR$ pushd ~
~ ~/code/linwoodc3_gdeltPyR
philip@tenofdiamonds:~$ py.test --version
This is pytest version 3.3.2, imported from /usr/lib/python2.7/dist-packages/pytest.pyc


## Tests working
Well, almost everything passes except things depending on geopandas etc.

___________________________________________________________________________ testGDELTVectorizingFuncs.test_geopandas_import_pass ___________________________________________________________________________

self = <tests.test_vectorizing.testGDELTVectorizingFuncs testMethod=test_geopandas_import_pass>

    def test_geopandas_import_pass(self):
        """Test ability to import geopandas and create spatial object"""
>       import geopandas as gpd
E       ModuleNotFoundError: No module named 'geopandas'

tests/test_vectorizing.py:128: ModuleNotFoundError
_______________________________________________________________________ testGDELTVectorizingFuncs.test_geopandas_import_pass_normcol _______________________________________________________________________

self = <tests.test_vectorizing.testGDELTVectorizingFuncs testMethod=test_geopandas_import_pass_normcol>

    def test_geopandas_import_pass_normcol(self):
>       import geopandas as gpd
E       ModuleNotFoundError: No module named 'geopandas'

tests/test_vectorizing.py:136: ModuleNotFoundError



- ATTEMPT

Ignoring mock: markers 'python_version < "3.3"' don't match your environment
Ignoring unittest2: markers 'python_version < "2.7"' don't match your environment
Ignoring ordereddict: markers 'python_version < "2.7"' don't match your environment
Requirement already satisfied: pandas>=0.20 in /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (from -r requirements_geo.txt (line 1)) (0.23.4)
Requirement already satisfied: numpy>=1.11.1 in /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (from -r requirements_geo.txt (line 2)) (1.15.4)
Requirement already satisfied: requests>=2.11.1 in /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (from -r requirements_geo.txt (line 3)) (2.20.1)
Requirement already satisfied: six>=1.10.0 in /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (from -r requirements_geo.txt (line 4)) (1.11.0)
Requirement already satisfied: python-dateutil>=2.5.3 in /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (from -r requirements_geo.txt (line 5)) (2.7.5)
Requirement already satisfied: beautifulsoup4 in /home/philip/.virtualenvs/gdelt-demo/lib/python3.6/site-packages (from -r requirements_geo.txt (line 6)) (4.6.3)
Collecting Cython>=0.16 (from -r requirements_geo.txt (line 8))
  Downloading https://files.pythonhosted.org/packages/a2/e0/0592be5b851c8013aa253592606ca265862d27444d908e029fd75d563c9c/Cython-0.29.1-cp36-cp36m-manylinux1_x86_64.whl (2.1MB)
    100% |████████████████████████████████| 2.1MB 1.1MB/s 
Collecting shapely>=1.2.18 (from -r requirements_geo.txt (line 9))
  Downloading https://files.pythonhosted.org/packages/38/b6/b53f19062afd49bb5abd049aeed36f13bf8d57ef8f3fa07a5203531a0252/Shapely-1.6.4.post2-cp36-cp36m-manylinux1_x86_64.whl (1.5MB)
    100% |████████████████████████████████| 1.5MB 1.8MB/s 
Collecting fiona>=1.0.1 (from -r requirements_geo.txt (line 10))
  Downloading https://files.pythonhosted.org/packages/d2/fd/7176a0c31a5d915b09190832f9d96c4da95bd57f9d2d4ebab26e102d8d85/Fiona-1.8.2-cp36-cp36m-manylinux1_x86_64.whl (17.9MB)
    100% |████████████████████████████████| 17.9MB 829kB/s 
Collecting pyproj>=1.9.3 (from -r requirements_geo.txt (line 11))
  Downloading https://files.pythonhosted.org/packages/29/72/5c1888c4948a0c7b736d10e0f0f69966e7c0874a660222ed0a2c2c6daa9f/pyproj-1.9.5.1.tar.gz (4.4MB)
    100% |████████████████████████████████| 4.4MB 2.0MB/s 
