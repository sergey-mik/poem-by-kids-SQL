--SELECT *
--FROM Grade;

--SELECT *
--FROM Emotion;

--SELECT *
--FROM Poem;

					-- 4-6 --
--SELECT TOP 76 a.Name AS 'Author', gr.Name AS 'Grade', g.Name AS 'Gender'
--From Author a
--LEFT JOIN Grade gr ON a.GradeId = gr.Id
--LEFT JOIN Gender g ON a.GenderId = g.Id 
--ORDER BY a.Name ASC;

--SELECT SUM(WordCount) AS 'Total Word Count'
--FROM Poem;

--SELECT TOP 1 CharCount
--FROM Poem
--ORDER BY CharCount DESC;

					-- 9 --
--SELECT COUNT(a.id) AS 'Number of Authors in 1st Grade'
--FROM Author a
--LEFT JOIN Grade g ON a.GradeId = g.Id
--WHERE g.Id = 1

					-- 10 --
--SELECT COUNT(a.id) AS 'Number of 1st through 3rd Graders'
--FROM Author a
--LEFT JOIN Grade g ON a.GradeId = g.Id
--WHERE g.Id = 1 OR g.Id = 2 OR g.Id = 3;

					-- 11 --
--SELECT COUNT(p.Id) AS 'Total number of Poems in 4th Grade'
--FROM Poem p
--INNER JOIN Author a ON p.AuthorId = a.Id
--INNER JOIN Grade g ON a.GradeId = g.Id
--WHERE g.Id = 4;

					-- 12 --
--SELECT COUNT(p.Id) AS 'Number of Poems by Grade', g.Name AS 'Grade'
--FROM POEM p
--LEFT JOIN Author a ON p.AuthorId = a.Id
--LEFT JOIN Grade g ON a.GradeId = g.Id
--GROUP BY g.Name;

--Select COUNT(a.Id) AS 'Number of Authors', g.Name AS 'Grade'
--FROM Author a
--LEFT JOIN Grade g ON a.GradeId = g.Id
--GROUP BY g.Name
--ORDER BY g.Name;

--SELECT TOP 1 Title, WordCount
--FROM Poem
--Order By WordCount DESC;

					-- 15 --
--SELECT a.Name, COUNT(p.id) AS 'Number of Poems'
--FROM Author a
--LEFT JOIN Poem p ON p.AuthorId = a.Id
--GROUP BY A.Id, A.Name
--ORDER BY 'Number of Poems' DESC;

					-- 16 --
--SELECT COUNT(p.Id) AS PoemCount, e.Name
--FROM Poem p
--INNER JOIN PoemEmotion pm ON p.Id = pm.PoemId
--INNER JOIN Emotion e ON e.Id = pm.EmotionId
--WHERE e.Name = 'Sadness'
--GROUP BY e.Name;

					-- 17 --
--SELECT COUNT(p.Id) AS PoemCount
--FROM Poem p
--LEFT JOIN PoemEmotion pm ON p.Id = pm.PoemId
--LEFT JOIN Emotion e ON e.Id = pm.EmotionId
--WHERE e.Name IS NULL;

					-- 18 --
--SELECT TOP 1 e.Name AS EmotionName, COUNT(p.Id) AS PoemCount
--FROM Emotion e
--JOIN PoemEmotion pm ON e.Id = pm.EmotionId
--JOIN Poem p ON p.Id = pm.PoemId
--GROUP BY e.Name
--ORDER BY PoemCount ASC;

					-- 19 --
--SELECT TOP 1 g.Name AS 'Grade', COUNT(p.id) AS 'Number of Poems', e.Name AS 'Emotion' 
--FROM Poem p
--LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--LEFT JOIN Emotion e ON e.Id = pe.EmotionId
--LEFT JOIN Author a ON a.Id = p.AuthorId
--LEFT JOIN Grade g ON g.Id = a.GradeId
--WHERE e.Name = 'Joy'
--GROUP BY E.Name, G.Name
--ORDER BY 'Number of Poems' DESC;

					-- 20 --
SELECT g.Name AS 'Gender', COUNT(p.id) AS 'Number of Poems', e.Name AS 'Emotion'
FROM Poem p
LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
LEFT JOIN Emotion e ON e.Id = pe.EmotionId
LEFT JOIN Author a ON a.Id = p.AuthorId
LEFT JOIN Gender g ON g.Id = a.GenderId
Where E.Name = 'Fear'
GROUP BY g.Name, e.Name
ORDER BY 'Number of Poems';
