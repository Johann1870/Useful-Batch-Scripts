@ECHO OFF

::This should convert docx files to png files
:: It then performs processing on the files
:: this is still pretty raw
:: J. Ditzel

:: Oct 2017


CD C:\Users\jditzel\snadbox\pdf
::FOR /R %%Q IN (*.docx) DO doc2pdf.vbs %%~nxQ
::FOR /R %%Q IN (*.pdf) DO MOVE %%~nxQ pdf\%%~nxQ

::converts to png
::convert -density 300 -trim -background white -quality 100 -alpha remove IRR_Case_Study_21-59_October_2017.pdf IRR_Case_Study_21-59_October_2017.png
::removes logo
::convert IRR_Case_Study_21-59_October_2017-0.png -fill white -stroke none -draw "rectangle 1057,0 2356,328" test1.png

::removes base
convert test1.png -fill white -stroke none -draw "rectangle 0,3000 2356,3239" test2.png

::trims and flattens
convert test2.png -flatten -trim test3.png

@ECHO ON