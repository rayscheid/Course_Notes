## 9/19/18:
What would grep '^$' filename do?  
    -find lines that do not have any characters   
Binary files = executable files  
separate directories for:  
    -data  
    -scripts  
    -binaries (of other people’s programs that you used)  
    -results, or analysis  
    -figures  
    -manuscript  
    -or even: subprojects, each with its own script & analysis directories

## 9/24/18:
HW 1.1: simple answer  
```Shell
for i in {1:9}  
do  
    mv log/timetest${i}_snaq.log log/timetest0${i}_snaq.log  
    mv out/timetest${i}_snaq.out out/timetest0${i}_snaq.out  
    done
```
## 9/26/18:
-To delete git repository, remove .git file - must use "rm -f"  
-git push to update in git, git pull to take changes from someone else  
-git merge to put together  
### Git pull-Very important:
-pull often!  
-commit your changes before pulling. Any change to an uncommitted file would stop the pull update.

## 10/1/18
-For comments, don't write what code does, this is obvious from code. Write assumptions that cannot be gathered from code alone.  

exercise: extract all the features (and counts) for gene “ENSMUSG00000033793”, from file Mus_musculus.GRCm38.75_chr1.gtf. [1 line = 1 feature, the feature name is in the 3rd column]

```shell
grep “ENSMUSG00000033793” Mus_musculus.GRCm38.75_chr1.gtf | less -S
grep “ENSMUSG00000033793” Mus_musculus.GRCm38.75_chr1.gtf | cut -f 3 | less
grep “ENSMUSG00000033793” Mus_musculus.GRCm38.75_chr1.gtf | cut -f 3 | sort | uniq
grep “ENSMUSG00000033793” Mus_musculus.GRCm38.75_chr1.gtf | cut -f 3 | sort | uniq -c
```
### sed
-"/" can be any character,b ut moust remain the same character  
-Always use > instead of >> so you don't over-write the previous file  
-sed 's/chrom/chr/' chroms.txt = sed 's/om//' chroms.txt  
-sed does not recognize all "enhanced' expressions  
```shell
ray-scheids-macbook:chapter-07-unix-data-tools rayscheid$ echo "chr12:74-431" | sed -E 's/^(chr[^:]+):([0-9]+)-([0-9]+)/\1 \2 \3/'
output: chr12 74 431
```
-exercise: extract the unique transcript names in the data file Mus_musculus.GRCm38.75_chr1.gtf: string after “transcript_id”.  

```shell
less Mus_musculus.GRCm38.75_chr1.gtf # type /transcript_id to search and highlight instances
grep -E -o 'transcript_id "\w+"' Mus_musculus.GRCm38.75_chr1.gtf |
  cut -f2 -d" " | sed 's/"//g' | sort | uniq | head # or redirect: > newFileName.txt
grep -v "^#" Mus_musculus.GRCm38.75_chr1.gtf |
  sed -E 's/.*transcript_id "([^"]+)".*/\1/' | head # wait: doesn't work: extract lines!
grep -v "^#" Mus_musculus.GRCm38.75_chr1.gtf |
  sed -E -n 's/.*transcript_id "([^"]+)".*/\1/p' | sort | uniq | head
```
## 10/3/18
```shell
ray-scheids-macbook:chapter-07-unix-data-tools rayscheid$ bash headtail.sh Mus_musculus.GRCm38.75_chr1.bed 
script name: headtail.sh
first argument: Mus_musculus.GRCm38.75_chr1.bed
number of arguments: 1
1	3054233	3054733
1	3054233	3054733
1	195240910	195241007
1	195240910	195241007
ray-scheids-macbook:chapter-07-unix-data-tools rayscheid$ bash headtail.sh Mus_musculus.GRCm38.75_chr1.bed | column -t
script  name:      headtail.sh
first   argument:  Mus_musculus.GRCm38.75_chr1.bed
number  of         arguments:                       1
1       3054233    3054733
1       3054233    3054733
1       195240910  195241007
1       195240910  195241007
```
-To change permissions
```shell
chmod u+x headtail.sh
```
## 10/8/18
- 1 byte = 8 bits  
- 1 nibble = 4 bits  
- 0000 = 0  
- 0001 = 1  
- 0010 = 2  
- ...  
- 1111 = 15  
- nibble 16 base  
- 0 1 2 ... 8 9 a b c d e f  
- 0000     1000         1111 (15)  

## 10/10/18  
```shell
awk '/Lypla1/ { feature[$3] += 1 };
    END { for (k in feature)
    print k "\t" feature[k] }' Mus_musculus.GRCm38.75_chr1.gtf  | column -t
  ```  
- This is an array, feature is a variable  
- feature[$3] += 1 (thrid column, "gene")  
- feature[gene] = 1 (increment by 1)  
- feature  
  gene --> 1 (finds another gene --> 2)  
  transcript --> 1  
  exon --> 1  
  gene, etc = keys, number = values  