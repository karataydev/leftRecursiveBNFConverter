%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "y.tab.h"
extern FILE *yyin;
FILE *fptr;
int linenum=-1;
int countline=0;
char arr[200][200];
char **arrleft;
char arrfirst[200];
char arrsecond[200];
char arrfirstright[200];
char arrsecondright[200];
extern int line;
int linechanged;
char c[200];
int index1=0,index2=0;
int count=0;

%}
%union
{
	char *string;
}
%token <string> NONTERMINAL TERMINAL
%token LESS GREATER MINUS ENDL
%type <string> left middle right otherright
%%

bnf:
	commands ENDL bnf
	|
	commands bnf
	|
	/*epsilon*/


commands:
	
	left middle right
	{
		printf("line: %d\n",countline);
		linenum++;

		if((strcmp($1, $3)) == 0){
			
			
			printf("left recursion 1 at line: %d\n",linenum);
			int l,s;
			//get second line to array
			if(arr[linenum+1][0]=='<'){
			
				for(l=0; arr[linenum+1][l+1] != '>';l++ ){
					arrsecond[l] = arr[linenum+1][l+1];
				}
			}
			arrsecond[l]='\0';

			//get first line to array
			if(arr[linenum][0]=='<'){
			
				for(l=0; arr[linenum][l+1] != '>';l++ ){
					arrfirst[l] = arr[linenum][l+1];
				}
			}
			arrfirst[l]='\0';


			int count=0;
			if(strcmp(arrfirst,arrsecond)==0){

				fprintf(fptr,"<");

				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 


				
				for(l=0,s=0; arr[linenum+1][l+2] != '\0';l++ ){
					if(count>=2){
						arrsecondright[s] = arr[linenum+1][l];
						s++;
						
						fprintf(fptr,"%c",arr[linenum+1][l]);
						
						
					}
					else if(arr[linenum+1][l] != '>')
						count++;
					
					
				}
				fprintf(fptr," ");	

				arrsecondright[s]='\0';
				
				

				


				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2>\n");

				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2> -> epsilon\n");

				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2> ->");
				
				for(l=0; arrleft[linenum][l+1] != '\0';l++ ){

				}

				for(l=l; l>=0;l-- ){
					fprintf(fptr,"%c",arrleft[linenum][l]);
				}
				fprintf(fptr," <");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2>");
				fprintf(fptr,"\n");
				
			}
			

			


			
		}
		else{
			int l;
			if(arr[linenum][0]=='<'){
			
				for(l=0; arr[linenum][l+1] != '>';l++ ){
					arrsecond[l] = arr[linenum][l+1];
				}
			}
			arrsecond[l]='\0';
			if(strcmp(arrfirst,arrsecond)!=0){
				fprintf(fptr,"%s",arr[linenum]);
			}
			
			
		}

	}
	|
	left middle right
	{
		linenum++;
		if((strcmp($1, $3)) == 0){
			
			
			printf("left recursion 2 at line: %d\n",linenum);
			int l,s;
			//get second line to array
			if(arr[linenum+1][0]=='<'){
			
				for(l=0; arr[linenum+1][l+1] != '>';l++ ){
					arrsecond[l] = arr[linenum+1][l+1];
				}
			}
			arrsecond[l]='\0';

			//get first line to array
			if(arr[linenum][0]=='<'){
			
				for(l=0; arr[linenum][l+1] != '>';l++ ){
					arrfirst[l] = arr[linenum][l+1];
				}
			}
			arrfirst[l]='\0';


			int count=0;
			if(strcmp(arrfirst,arrsecond)==0){

				fprintf(fptr,"<");

				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 


				
				for(l=0,s=0; arr[linenum+1][l+2] != '\0';l++ ){
					if(count>=2){
						arrsecondright[s] = arr[linenum+1][l];
						s++;
						
						fprintf(fptr,"%c",arr[linenum+1][l]);
						
						
					}
					else if(arr[linenum+1][l] != '>')
						count++;
					
					
				}
				fprintf(fptr," ");	

				arrsecondright[s]='\0';
				
				

				


				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2>\n");

				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2> -> epsilon\n");

				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2> ->");
				
				for(l=0; arrleft[linenum][l+1] != '\0';l++ ){

				}

				for(l=l; l>=0;l-- ){
					fprintf(fptr,"%c",arrleft[linenum][l]);
				}
				fprintf(fptr," <");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2>");
				fprintf(fptr,"\n");

			}
			

			

		

			
		}
		else{
			int l;
			if(arr[linenum][0]=='<'){
			
				for(l=0; arr[linenum][l+1] != '>';l++ ){
					arrsecond[l] = arr[linenum][l+1];
				}
			}
			arrsecond[l]='\0';
			if(strcmp(arrfirst,arrsecond)!=0){
				fprintf(fptr,"%s",arr[linenum]);
			}
		
		}

	}
	|
	left middle right
	{
		
		linenum++;
		if((strcmp($1, $3)) == 0){
			
			
			printf("left recursion 3 at line: %d\n",linenum);
			int l,s;
			//get second line to array
			if(arr[linenum+1][0]=='<'){
			
				for(l=0; arr[linenum+1][l+1] != '>';l++ ){
					arrsecond[l] = arr[linenum+1][l+1];
				}
			}
			arrsecond[l]='\0';

			//get first line to array
			if(arr[linenum][0]=='<'){
			
				for(l=0; arr[linenum][l+1] != '>';l++ ){
					arrfirst[l] = arr[linenum][l+1];
				}
			}
			arrfirst[l]='\0';


			int count=0;
			if(strcmp(arrfirst,arrsecond)==0){

				fprintf(fptr,"<");

				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 


				
				for(l=0,s=0; arr[linenum+1][l+2] != '\0';l++ ){
					if(count>=2){
						arrsecondright[s] = arr[linenum+1][l];
						s++;
						
						fprintf(fptr,"%c",arr[linenum+1][l]);
						
						
					}
					else if(arr[linenum+1][l] != '>')
						count++;
					
					
				}
				fprintf(fptr," ");	

				arrsecondright[s]='\0';
				
				

				


				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2>\n");

				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2> -> epsilon\n");

				fprintf(fptr,"<");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2> ->");
				
				for(l=0; arrleft[linenum][l+1] != '\0';l++ ){

				}

				for(l=l; l>=0;l-- ){
					fprintf(fptr,"%c",arrleft[linenum][l]);
				}
				fprintf(fptr," <");
				for(l=0;arrfirst[l] != '\0';l++){
					fprintf(fptr,"%c",arrfirst[l]);
				} 
				fprintf(fptr,"2>");
				fprintf(fptr,"\n");

			}
			


		

			
		}
		else{
			int l;
			if(arr[linenum][0]=='<'){
			
				for(l=0; arr[linenum][l+1] != '>';l++ ){
					arrsecond[l] = arr[linenum][l+1];
				}
			}
			arrsecond[l]='\0';
			if(strcmp(arrfirst,arrsecond)!=0){
				fprintf(fptr,"%s",arr[linenum]);
			}
			
		}


	}
	;

left:
	LESS NONTERMINAL GREATER
	{
			
			$$=$2;
	}
	;

middle:
	MINUS GREATER
	{
		countline++;
	}
	;

right:
	LESS NONTERMINAL GREATER otherright
	{
		arrleft[index1][index2]='\0';
		
		index1++;
	
		index2=0;
		$$=$2;
		
	}
	|
	TERMINAL right
	{
		$$="";
		arrleft[index1][index2]='\0';
		
		index1++;
	
		index2=0;
	
	}
	|
	/*epsilon*/

	;

otherright:
	LESS NONTERMINAL GREATER otherright
	{

		int j;
		arrleft[index1][index2] = '<';
		index2++;
		for(j=0; j < strlen($2); j++,index2++){
			arrleft[index1][index2] = $2[j];
		}
		arrleft[index1][index2]='>';
		index2++;
		arrleft[index1][index2]=' ';
		index2++;

	}
	|
	TERMINAL otherright
	{
		
		
		int j;
		for(j=0; j < strlen($1); j++,index2++){
			arrleft[index1][index2] = $1[j];
		}
		arrleft[index1][index2]=' ';
		index2++;
	}
	|
	/*epsilon*/
	;




%%
void yyerror(char *s){
	fprintf(stderr,"error: %s%d\n",s,line);
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
	arrleft = malloc(200);
	for(int k=0; k < 200; k++){
		arrleft[k] = malloc(20);
		arrleft[k][0] = '\0';
	}
	int i = 0;
	fptr = fopen("output.txt","w");
	if(fptr==NULL){
		printf("Error!");
		exit(1);
	}
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
	while(fgets(arr[i], 200, yyin)){
		arr[i][strlen(arr[i])] = '\0';
		i++;

	}

	for(int k = 0; k < i; ++k){
		printf("%s",arr[k]);
	}
	
	
	
	printf("\n");
	yyin=fopen(argv[1],"r");
    yyparse();

	
			
		
    fclose(yyin);
	fclose(fptr);
    return 0;
}
