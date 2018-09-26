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