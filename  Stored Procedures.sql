

--------------------------------------------------------------------------
-- Get procedure not generated: all columns are part of the primary key --
--------------------------------------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[Eventsalarm_intrusionevents_mappingGetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [Eventsalarm_intrusionevents_mappingGetAll];
GO

CREATE PROCEDURE [dbo].[Eventsalarm_intrusionevents_mappingGetAll]
AS
BEGIN
	SELECT
		[eventsAlarmId],
		[intrusionEventId]
	FROM eventsalarm_intrusionevents_mapping
    WHERE baja = 0

END
GO
-----------------------------------------------------------------------
-- Update procedure not generated: all columns are part of the primary key
-----------------------------------------------------------------------



IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[Eventsalarm_intrusionevents_mappingAdd]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [Eventsalarm_intrusionevents_mappingAdd];
GO

CREATE PROCEDURE [dbo].[Eventsalarm_intrusionevents_mappingAdd]
(
	@idUsuario INT,
	@ip VARCHAR(300),
	@host VARCHAR(300),
	@eventsAlarmId INT(11),
	@intrusionEventId CHAR(20)
)
AS
BEGIN


	INSERT
	INTO [eventsalarm_intrusionevents_mapping]
	(
		[eventsAlarmId],
		[intrusionEventId]
	)
	VALUES
	(
		@eventsAlarmId,
		@intrusionEventId
	)


END
GO

-----------------------------------------------------------------------
-- Delete procedure not generated: all columns are part of the primary key
-----------------------------------------------------------------------



if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TablaLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TablaLog](
	[idTablaLog] [int] IDENTITY(1,1) NOT NULL,
	[accion] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tabla] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[id] [int] NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[ip] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[host] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,

CONSTRAINT [PK_TablaLog] PRIMARY KEY CLUSTERED 
(
	[idTablaLog] ASC
) WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

END
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[TablaLogAdd]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [TablaLogAdd];
GO

CREATE PROCEDURE [dbo].[TablaLogAdd]
(
	@accion varchar(300),
	@tabla varchar(300),
	@id int,
	@idUsuario int,
	@ip varchar(300),
	@host varchar(300)
)
AS
BEGIN
	INSERT INTO [TablaLog]
	(
		[accion],
		[tabla],
		[id],
		[fechaHora],
		[idUsuario],
		[ip],
		[host]
	)
	VALUES
	(
		@accion,
		@tabla,
		@id,
		getDate(),
		@idUsuario,
		@ip,
		@host
	)

	SELECT CAST(SCOPE_IDENTITY() as INT)
END
GO

