Tips - shell snippet
====================

- [shell](#shell)
- [wget](#wget)


## shell
### Count the number of files in a directory
```sh
% ls -1U ./target_dir | wc -l
123
```


## wget
### Download sequence files
```sh
# Download - file_0.jpg ~ file_100.jpg
dir='./files'
for n in $(seq 0 100); do
  url="http://example.com/files/file_${n}.jpg"
  wget -P ${dir} ${url}
done

# Download - file_000.jpg ~ file_100.jpg
dir='./files'
for n in $(seq -w 0 100); do
  url="http://example.com/files/file_${n}.jpg"
  wget -P ${dir} ${url}
done
```

### specify UserAgent
```sh
UA="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36"
wget --user-agent="${UA}" http://example.com/hoge.tar.gz
```
