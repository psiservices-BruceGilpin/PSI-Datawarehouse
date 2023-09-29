/**************************************************
CREATED BY: William Davis
CREATED ON: 3/31/2022
DESC:
	Strips HTML Tags from Field 

***************************************************/

CREATE FUNCTION 
	[dbo].[udf_StripHTML] 
(
@HTMLText varchar(MAX)
)
RETURNS varchar(MAX)
AS
BEGIN
DECLARE @Start  int
DECLARE @End    int
DECLARE @Length int

set @HTMLText = replace(@htmlText, '<br>',CHAR(13) + CHAR(10))
set @HTMLText = replace(@htmlText, '<br/>',CHAR(13) + CHAR(10))
set @HTMLText = replace(@htmlText, '<br />',CHAR(13) + CHAR(10))
set @HTMLText = replace(@htmlText, '<li>','- ')
set @HTMLText = replace(@htmlText, '</li>',CHAR(13) + CHAR(10))

set @HTMLText = replace(@htmlText, '&rsquo;' collate Latin1_General_CS_AS, ''''  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&quot;' collate Latin1_General_CS_AS, '"'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&amp;' collate Latin1_General_CS_AS, '&'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&euro;' collate Latin1_General_CS_AS, 'â‚¬'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&lt;' collate Latin1_General_CS_AS, '<'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&gt;' collate Latin1_General_CS_AS, '>'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&oelig;' collate Latin1_General_CS_AS, 'oe'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&nbsp;' collate Latin1_General_CS_AS, ' '  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&copy;' collate Latin1_General_CS_AS, 'Â©'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&laquo;' collate Latin1_General_CS_AS, 'Â«'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&reg;' collate Latin1_General_CS_AS, 'Â®'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&plusmn;' collate Latin1_General_CS_AS, 'Â±'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&sup2;' collate Latin1_General_CS_AS, 'Â²'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&sup3;' collate Latin1_General_CS_AS, 'Â³'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&micro;' collate Latin1_General_CS_AS, 'Âµ'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&middot;' collate Latin1_General_CS_AS, 'Â·'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ordm;' collate Latin1_General_CS_AS, 'Âº'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&raquo;' collate Latin1_General_CS_AS, 'Â»'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&frac14;' collate Latin1_General_CS_AS, 'Â¼'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&frac12;' collate Latin1_General_CS_AS, 'Â½'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&frac34;' collate Latin1_General_CS_AS, 'Â¾'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&Aelig' collate Latin1_General_CS_AS, 'Ã†'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&Ccedil;' collate Latin1_General_CS_AS, 'Ã‡'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&Egrave;' collate Latin1_General_CS_AS, 'Ãˆ'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&Eacute;' collate Latin1_General_CS_AS, 'Ã‰'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&Ecirc;' collate Latin1_General_CS_AS, 'ÃŠ'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&Ouml;' collate Latin1_General_CS_AS, 'Ã–'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&agrave;' collate Latin1_General_CS_AS, 'Ã '  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&acirc;' collate Latin1_General_CS_AS, 'Ã¢'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&auml;' collate Latin1_General_CS_AS, 'Ã¤'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&aelig;' collate Latin1_General_CS_AS, 'Ã¦'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ccedil;' collate Latin1_General_CS_AS, 'Ã§'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&egrave;' collate Latin1_General_CS_AS, 'Ã¨'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&eacute;' collate Latin1_General_CS_AS, 'Ã©'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ecirc;' collate Latin1_General_CS_AS, 'Ãª'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&euml;' collate Latin1_General_CS_AS, 'Ã«'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&icirc;' collate Latin1_General_CS_AS, 'Ã®'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ocirc;' collate Latin1_General_CS_AS, 'Ã´'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ouml;' collate Latin1_General_CS_AS, 'Ã¶'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&divide;' collate Latin1_General_CS_AS, 'Ã·'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&oslash;' collate Latin1_General_CS_AS, 'Ã¸'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ugrave;' collate Latin1_General_CS_AS, 'Ã¹'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&uacute;' collate Latin1_General_CS_AS, 'Ãº'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&ucirc;' collate Latin1_General_CS_AS, 'Ã»'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&uuml;' collate Latin1_General_CS_AS, 'Ã¼'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&quot;' collate Latin1_General_CS_AS, '"'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&amp;' collate Latin1_General_CS_AS, '&'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&lsaquo;' collate Latin1_General_CS_AS, '<'  collate Latin1_General_CS_AS)
set @HTMLText = replace(@htmlText, '&rsaquo;' collate Latin1_General_CS_AS, '>'  collate Latin1_General_CS_AS)


-- Remove anything between <STYLE> tags
SET @Start = CHARINDEX('<STYLE', @HTMLText)
SET @End = CHARINDEX('</STYLE>', @HTMLText, CHARINDEX('<', @HTMLText)) + 7
SET @Length = (@End - @Start) + 1

WHILE (@Start > 0 AND @End > 0 AND @Length > 0) BEGIN
SET @HTMLText = STUFF(@HTMLText, @Start, @Length, '')
SET @Start = CHARINDEX('<STYLE', @HTMLText)
SET @End = CHARINDEX('</STYLE>', @HTMLText, CHARINDEX('</STYLE>', @HTMLText)) + 7
SET @Length = (@End - @Start) + 1
END

-- Remove anything between <whatever> tags
SET @Start = CHARINDEX('<', @HTMLText)
SET @End = CHARINDEX('>', @HTMLText, CHARINDEX('<', @HTMLText))
SET @Length = (@End - @Start) + 1

WHILE (@Start > 0 AND @End > 0 AND @Length > 0) BEGIN
SET @HTMLText = STUFF(@HTMLText, @Start, @Length, '')
SET @Start = CHARINDEX('<', @HTMLText)
SET @End = CHARINDEX('>', @HTMLText, CHARINDEX('<', @HTMLText))
SET @Length = (@End - @Start) + 1
END

RETURN LTRIM(RTRIM(@HTMLText))

END