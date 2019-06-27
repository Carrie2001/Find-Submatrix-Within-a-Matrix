%Program3_demo.m
%
%Author: Michael Moloney
%Account: mmoloney1
%CSC 4630 Program #3
%
%Due Date: Oct.25, 2018
%
%Description:
%This program demos Program3_function.m. Three matrices are created with
%this program(two of which are randomly generated). These matrices consist
%of a numerical, a character, and a logical to demonstrate that the
%function works with all Matlab data types. The user has to input the row
%and column size of the submatrices and populate them. After the function
%searches for the submatrices within the larger matrices, an output is
%displayed showing the count as well as the row and column coordinates of 
%any found matches.
%
%Input:
%Row and column size for each of the three submatrices to be tested. As
%well as the elements to populate these matrices(numerical,character, then
%logical).
%
%Output:
%The count of found matches. the upper left row and column coordinates of
%each found match.
%
%Usage:
%Enter # of submatrix rows: 2. Enter # of submatrix columns: 2.
%Enter matrix input: 3. Enter matrix input: 5.
%Enter matrix input: 3. Enter matrix input: 5.
%subMatrix = 3    5
%            3    5
%count = 1. row = 12. column = 1
%(repeats two more times for the remaining matrices)
%

%Numerical matrix is randomly generated then displayed to the user
disp('Numerical Matrix');
numMat = randi([1,9],15,15)
%User is asked to input submatrix dimensions
disp('Lets create a submatrix to look for in this numerical matrix.');

subMatRows = input('Enter # of submatrix rows:');
subMatCols = input('Enter # of submatrix columns:');
%for loop is used to populate submatrix. Submatrix is then displayed.
for i=1:subMatRows
    for j=1:subMatCols
        subMatrix(i,j)=input('Enter numerical matrix input:');
    end
end
subMatrix
%Function is called with matrix and submatrix as inputs. Count row(s) and
%column(s) are displayed to user.
[count,row,column] = Program3_function(numMat,subMatrix)
%Steps are repeated for character matrix
charMatrix = ['dkeeelllddqqooe';'gooddeellkkdeeo';'goeeoappdlleefj';
    'dkdoowelaaopdel';'wwwoocmmelllauu';'aaoommllssuuccl';
    'dkeeelllddqqooe';'gooddeellkkdeeo';'goeeoappdlleefj';
    'dkdoowelaaopdel';'wwwoocmmelllauu';'aaoommllssuuccl';
    'fjoemdoslleooos';'qoejmdoslaoemww';'wpppofuclskdofl']

disp('Lets create a submatrix to look for in this character matrix.');

subMatRows2 = input('Enter # of submatrix rows:');
subMatCols2 = input('Enter # of submatrix columns:');

for i=1:subMatRows2
    for j=1:subMatCols2
        subMatrix2(i,j)=input('Enter character matrix input:');
    end
end
subMatrix2

[count,row,column] = Program3_function(charMatrix,subMatrix2)
%Steps are repeated for logical matrix.
logicalMatrix = boolean(randi([0,1],15,15))

disp('Lets create a submatrix to look for in this logical matrix.');

subMatRows3 = input('Enter # of submatrix rows:');
subMatCols3 = input('Enter # of submatrix columns:');

for i=1:subMatRows3
    for j=1:subMatCols3
        subMatrix3(i,j)=input('Enter logical(0,1) matrix input:');
    end
end
subMatrix3 = boolean(subMatrix3)

[count,row,column] = Program3_function(logicalMatrix,subMatrix3)