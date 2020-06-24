package com.yue;


import java.text.DecimalFormat;

public class Matrix {

    public static void main(String[] args) {
        Matrix cal=new Matrix();
        cal.caculate("1,2,3,4,6,7,8,9,*2,2,2,2,");
    }

    public String caculate(String data){
        String[] Array1=data.split("\\*");

        String[] dataArr=Array1[0].split(",");
        String[] sizeArr=Array1[1].split(",");
        int row1=Integer.valueOf(sizeArr[0]);
        int col1=Integer.valueOf(sizeArr[1]);
        int row2=Integer.valueOf(sizeArr[2]);
        int col2=Integer.valueOf(sizeArr[3]);

        /*System.out.println("one"+row1);
        System.out.println("two"+col1);
        System.out.println("three"+row2);
        System.out.println("four"+col2);

        for(int i=0;i<dataArr.length;i++){
            System.out.println("num"+Integer.valueOf(dataArr[i]));
        }*/

        double[][] matrix1=new double[row1][col1];
        int count1=0;
        for(int i=0;i<row1;i++){
            for(int j=0;j<col1;j++){
                if(count1<row1*col1){
                    matrix1[i][j]=Double.valueOf(dataArr[count1]);
                    count1++;
                }
            }
        }

        /*for(int i=0;i<row1;i++){
            for(int j=0;j<col1;j++){

                System.out.println(matrix1[i][j]);
            }
        }*/

        double[][] matrix2=new double[row2][col2];
        int count2=count1;
        for(int i=0;i<row2;i++){
            for(int j=0;j<col2;j++){
                if(count2<dataArr.length){
                    matrix2[i][j]=Double.valueOf(dataArr[count2]);
                    count2++;
                }
            }
        }

        for(int i=0;i<row2;i++){
            for(int j=0;j<col2;j++){
                System.out.println(matrix2[i][j]);
            }
        }
        if (col1!= row2) {
            return null;
        }
        double[][] matrix3= new double[row1][col2];//构建一个新的矩阵，存放相乘后的结果
        for (int i = 0; i < row1; i++) {//矩阵要乘的行数
            for (int j = 0; j < col2; j++) {//每一行要乘的列数
                for (int k = 0; k < col1; k++) {//控制相加的次数  也可用this.col
                    matrix3[i][j] += matrix1[i][k] * matrix2[k][j];
                }
            }
        }

        DecimalFormat df = new DecimalFormat("0.0");
        String str=new String();
        for (int i = 0; i < row1; i++) {
            for (int j = 0; j < col2; j++) {
                str+=df.format(matrix3[i][j]) + ",";
            }
        }
        str=str+"*"+row1+","+col2;
        System.out.println(str);
        return str;
    }
}
