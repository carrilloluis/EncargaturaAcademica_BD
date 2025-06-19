DROP TABLE IF EXISTS [Actividad académica o Festividad];
CREATE TABLE IF NOT EXISTS [Actividad académica o Festividad]
(
	[id] INTEGER UNSIGNED NOT NULL, 
	[denominación] VARCHAR(128) NOT NULL,
	[fecha de inicio] DATE NOT NULL, -- CHAR(10) [formato ISO]
	[fecha de final] DATE NULL,  
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Responsable];
CREATE TABLE IF NOT EXISTS [Responsable]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos] VARCHAR(64) NOT NULL,
	-- {0 Docente, 1 Administrativo, 2 Estudiante }
	[cargo] CHAR(1) NOT NULL DEFAULT '0',
	PRIMARY KEY ([id]) 
) WITHOUT RowId;

DROP TABLE IF EXISTS [Encargatura];
CREATE TABLE IF NOT EXISTS [Encargatura]
(
	[id de festividad] INTEGER NOT NULL REFERENCES [Actividad académica o Festividad](id),
	[id del responsable] INTEGER NOT NULL REFERENCES [Responsable](id),
	--  {0 Pendiente, 1 Realizado, 2 Cancelado}
	[estado] CHAR(1) NOT NULL DEFAULT '0',
	PRIMARY KEY ('id de festividad', 'id del responsable')
) WITHOUT RowId;
