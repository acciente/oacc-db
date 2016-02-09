--------------------------------------------------------
-- Copyright 2009-2016, Acciente LLC
--
-- Acciente LLC licenses this file to you under the
-- Apache License, Version 2.0 (the "License"); you
-- may not use this file except in compliance with the
-- License. You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in
-- writing, software distributed under the License is
-- distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
-- OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing
-- permissions and limitations under the License.
--------------------------------------------------------

/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.3.4                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          oacc-schema-design.dez                          */
/* Project name:          OACC                                            */
/* Author:                Adinath Raveendra Raj                           */
/* Script type:           Database creation script                        */
/* Created on:            2015-11-02 17:53                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Sequences                                                              */
/* ---------------------------------------------------------------------- */

CREATE SEQUENCE [OACC].[OAC_ResourceClassID]
  AS BIGINT
  START WITH 1
  INCREMENT BY 1 
  MINVALUE  1 
  NO CYCLE
GO


CREATE SEQUENCE [OACC].[OAC_PermissionID]
  AS BIGINT
  START WITH 1
  INCREMENT BY 1 
  MINVALUE  1 
  NO CYCLE
GO


CREATE SEQUENCE [OACC].[OAC_DomainID]
  AS BIGINT
  START WITH 1
  INCREMENT BY 1 
  MINVALUE  1 
  NO CYCLE
GO


CREATE SEQUENCE [OACC].[OAC_ResourceID]
  AS BIGINT
  START WITH 1
  INCREMENT BY 1 
  MINVALUE  1 
  NO CYCLE
  CACHE 10
GO


/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourceClass"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_ResourceClass] (
    [ResourceClassID] BIGINT NOT NULL,
    [ResourceClassName] VARCHAR(128) NOT NULL,
    [IsAuthenticatable] SMALLINT NOT NULL,
    [IsUnauthenticatedCreateAllowed] SMALLINT NOT NULL,
    CONSTRAINT [PK_RC] PRIMARY KEY ([ResourceClassID])
)
GO


CREATE  INDEX [IX_RC_ResourceClassName] ON [OACC].[OAC_ResourceClass] ([ResourceClassName])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourceClassPermission"                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_ResourceClassPermission] (
    [ResourceClassID] BIGINT NOT NULL,
    [PermissionID] BIGINT NOT NULL,
    [PermissionName] VARCHAR(64) NOT NULL,
    CONSTRAINT [PK_RCP] PRIMARY KEY ([ResourceClassID], [PermissionID])
)
GO


CREATE  INDEX [IX_RCP_ResourceClassID] ON [OACC].[OAC_ResourceClassPermission] ([ResourceClassID])
GO


CREATE  INDEX [IX_RCP_ResClassID_PermName] ON [OACC].[OAC_ResourceClassPermission] ([ResourceClassID],[PermissionName])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Domain"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Domain] (
    [DomainID] BIGINT NOT NULL,
    [DomainName] VARCHAR(64) NOT NULL,
    [ParentDomainID] BIGINT,
    CONSTRAINT [PK_D] PRIMARY KEY ([DomainID])
)
GO


CREATE  INDEX [IX_D_ParentDomainID] ON [OACC].[OAC_Domain] ([ParentDomainID])
GO


CREATE  INDEX [IX_D_DomainName] ON [OACC].[OAC_Domain] ([DomainName])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Resource"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Resource] (
    [ResourceID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [DomainID] BIGINT NOT NULL,
    CONSTRAINT [PK_R] PRIMARY KEY ([ResourceID])
)
GO


CREATE  INDEX [IX_R_ResourceClassID] ON [OACC].[OAC_Resource] ([ResourceClassID])
GO


CREATE  INDEX [IX_R_DomainID] ON [OACC].[OAC_Resource] ([DomainID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResPerm"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_ResPerm] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedResourceID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [PermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrRP] PRIMARY KEY ([AccessorResourceID], [AccessedResourceID], [ResourceClassID], [PermissionID])
)
GO


CREATE  INDEX [IX_GrRP_AccessorResourceID] ON [OACC].[OAC_Grant_ResPerm] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrRP_AccessedResourceID] ON [OACC].[OAC_Grant_ResPerm] ([AccessedResourceID])
GO


CREATE  INDEX [IX_GrRP_GrantorResourceID] ON [OACC].[OAC_Grant_ResPerm] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrRP_ResourceClassID] ON [OACC].[OAC_Grant_ResPerm] ([ResourceClassID],[PermissionID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResCrPerm_PostCr"                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedDomainID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [PostCreatePermissionID] BIGINT NOT NULL,
    [PostCreateIsWithGrant] SMALLINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrRCrPPoCr] PRIMARY KEY ([AccessorResourceID], [AccessedDomainID], [ResourceClassID], [PostCreatePermissionID])
)
GO


CREATE  INDEX [IX_GrRCrPPoCr_ResClassID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr] ([ResourceClassID],[PostCreatePermissionID])
GO


CREATE  INDEX [IX_GrRCrPPoCr_AccessorResID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrRCrPPoCr_GrantorResID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrRCrPPoCr_AccessedDomainID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr] ([AccessedDomainID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_DomPerm_Sys"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_DomPerm_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedDomainID] BIGINT NOT NULL,
    [SysPermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrDPSys] PRIMARY KEY ([AccessorResourceID], [AccessedDomainID], [SysPermissionID])
)
GO


CREATE  INDEX [IX_GrDPSys_AccessorResourceID] ON [OACC].[OAC_Grant_DomPerm_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrDPSys_GrantorResourceID] ON [OACC].[OAC_Grant_DomPerm_Sys] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrDPSys_AccessedDomainID] ON [OACC].[OAC_Grant_DomPerm_Sys] ([AccessedDomainID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_DomCrPerm_PostCr_Sys"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_DomCrPerm_PostCr_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [PostCreateSysPermissionID] BIGINT NOT NULL,
    [PostCreateIsWithGrant] SMALLINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrDCrPPoCrSys] PRIMARY KEY ([AccessorResourceID], [PostCreateSysPermissionID])
)
GO


CREATE  INDEX [IX_GrDCrPPoCrSys_AccessorResID] ON [OACC].[OAC_Grant_DomCrPerm_PostCr_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrDCrPPoCrSys_GrantorResID] ON [OACC].[OAC_Grant_DomCrPerm_PostCr_Sys] ([GrantorResourceID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResPerm_Sys"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_ResPerm_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedResourceID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [SysPermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrRPSys] PRIMARY KEY ([AccessorResourceID], [AccessedResourceID], [ResourceClassID], [SysPermissionID])
)
GO


CREATE  INDEX [IX_GrRPSys_AccessorResourceID] ON [OACC].[OAC_Grant_ResPerm_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrRPSys_AccessedResourceID] ON [OACC].[OAC_Grant_ResPerm_Sys] ([AccessedResourceID])
GO


CREATE  INDEX [IX_GrRPSys_GrantorResourceID] ON [OACC].[OAC_Grant_ResPerm_Sys] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrRPSys_ResourceClassID] ON [OACC].[OAC_Grant_ResPerm_Sys] ([ResourceClassID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResCrPerm_PostCr_Sys"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedDomainID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [PostCreateSysPermissionID] BIGINT NOT NULL,
    [PostCreateIsWithGrant] SMALLINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrRCrPPoCrSys] PRIMARY KEY ([AccessorResourceID], [AccessedDomainID], [ResourceClassID], [PostCreateSysPermissionID])
)
GO


CREATE  INDEX [IX_GrRCrPPoCrSys_AccessorResID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrRCrPPoCrSys_GrantorResID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrRCrPPoCrSys_ResClassID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ([ResourceClassID])
GO


CREATE  INDEX [IX_GrRCrPPoCrSys_AccessedDomID] ON [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ([AccessedDomainID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_Global_ResPerm"                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_Global_ResPerm] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedDomainID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [PermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrGbRP] PRIMARY KEY ([AccessorResourceID], [AccessedDomainID], [ResourceClassID], [PermissionID])
)
GO


CREATE  INDEX [IX_GrGbRP_ResourceClassID] ON [OACC].[OAC_Grant_Global_ResPerm] ([ResourceClassID],[PermissionID])
GO


CREATE  INDEX [IX_GrGbRP_AccessorResourceID] ON [OACC].[OAC_Grant_Global_ResPerm] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrGbRP_GrantorResourceID] ON [OACC].[OAC_Grant_Global_ResPerm] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrGbRP_AccessedDomainID] ON [OACC].[OAC_Grant_Global_ResPerm] ([AccessedDomainID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_Global_ResPerm_Sys"                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_Global_ResPerm_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedDomainID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [SysPermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrGbRPSys] PRIMARY KEY ([AccessorResourceID], [AccessedDomainID], [ResourceClassID], [SysPermissionID])
)
GO


CREATE  INDEX [IX_GrGbRPSys_AccessorResID] ON [OACC].[OAC_Grant_Global_ResPerm_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrGbRPSys_GrantorResourceID] ON [OACC].[OAC_Grant_Global_ResPerm_Sys] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrGbRPSys_AccessedDomainID] ON [OACC].[OAC_Grant_Global_ResPerm_Sys] ([AccessedDomainID])
GO


CREATE  INDEX [IX_GrGbRPSys_ResClassID] ON [OACC].[OAC_Grant_Global_ResPerm_Sys] ([ResourceClassID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResCrPerm_Sys"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_ResCrPerm_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [AccessedDomainID] BIGINT NOT NULL,
    [ResourceClassID] BIGINT NOT NULL,
    [SysPermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrRCrPSys] PRIMARY KEY ([AccessorResourceID], [AccessedDomainID], [ResourceClassID], [SysPermissionID])
)
GO


CREATE  INDEX [IX_GrRCrPSys_AccessorResID] ON [OACC].[OAC_Grant_ResCrPerm_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrRCrPSys_GrantorResID] ON [OACC].[OAC_Grant_ResCrPerm_Sys] ([GrantorResourceID])
GO


CREATE  INDEX [IX_GrRCrPSys_ResClassID] ON [OACC].[OAC_Grant_ResCrPerm_Sys] ([ResourceClassID])
GO


CREATE  INDEX [IX_GrRCrPSys_AccessedDomID] ON [OACC].[OAC_Grant_ResCrPerm_Sys] ([AccessedDomainID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_DomCrPerm_Sys"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_Grant_DomCrPerm_Sys] (
    [AccessorResourceID] BIGINT NOT NULL,
    [SysPermissionID] BIGINT NOT NULL,
    [IsWithGrant] SMALLINT NOT NULL,
    [GrantorResourceID] BIGINT NOT NULL,
    CONSTRAINT [PK_GrDCrPSys] PRIMARY KEY ([AccessorResourceID], [SysPermissionID])
)
GO


CREATE  INDEX [IX_GrDCrPSys_AccessorResID] ON [OACC].[OAC_Grant_DomCrPerm_Sys] ([AccessorResourceID])
GO


CREATE  INDEX [IX_GrDCrPSys_GrantorResID] ON [OACC].[OAC_Grant_DomCrPerm_Sys] ([GrantorResourceID])
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourcePassword"                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_ResourcePassword] (
    [ResourceID] BIGINT NOT NULL,
    [Password] VARCHAR(128) NOT NULL,
    CONSTRAINT [PK_RP] PRIMARY KEY ([ResourceID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourceExternalID"                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [OACC].[OAC_ResourceExternalID] (
    [ResourceID] BIGINT NOT NULL,
    [ExternalID] VARCHAR(255) NOT NULL,
    CONSTRAINT [PK_RE] PRIMARY KEY ([ResourceID]),
    CONSTRAINT [UX_ExternalID] UNIQUE ([ExternalID])
)
GO


CREATE  INDEX [IX_RE_ExternalID] ON [OACC].[OAC_ResourceExternalID] ([ExternalID])
GO


/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [OACC].[OAC_Domain] ADD CONSTRAINT [D_D_ParentDomainID] 
    FOREIGN KEY ([ParentDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_ResourceClassPermission] ADD CONSTRAINT [RCP_RC_ResourceClassID] 
    FOREIGN KEY ([ResourceClassID]) REFERENCES [OACC].[OAC_ResourceClass] ([ResourceClassID])
GO


ALTER TABLE [OACC].[OAC_Resource] ADD CONSTRAINT [R_RC_ResourceClassID] 
    FOREIGN KEY ([ResourceClassID]) REFERENCES [OACC].[OAC_ResourceClass] ([ResourceClassID])
GO


ALTER TABLE [OACC].[OAC_Resource] ADD CONSTRAINT [R_D_DomainID] 
    FOREIGN KEY ([DomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm] ADD CONSTRAINT [GrRP_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm] ADD CONSTRAINT [GrRP_R_AccessedResourceID] 
    FOREIGN KEY ([AccessedResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm] ADD CONSTRAINT [GrRP_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm] ADD CONSTRAINT [GrRP_RCP_ResourceClassID] 
    FOREIGN KEY ([ResourceClassID], [PermissionID]) REFERENCES [OACC].[OAC_ResourceClassPermission] ([ResourceClassID],[PermissionID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr] ADD CONSTRAINT [GrRCrPPoCr_RCP_ResClassID] 
    FOREIGN KEY ([ResourceClassID], [PostCreatePermissionID]) REFERENCES [OACC].[OAC_ResourceClassPermission] ([ResourceClassID],[PermissionID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr] ADD CONSTRAINT [GrRCrPPoCr_R_AccessorResID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr] ADD CONSTRAINT [GrRCrPPoCr_R_GrantorResID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr] ADD CONSTRAINT [GrRCrPPoCr_D_AccessedDomainID] 
    FOREIGN KEY ([AccessedDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomPerm_Sys] ADD CONSTRAINT [GrDPSys_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomPerm_Sys] ADD CONSTRAINT [GrDPSys_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomPerm_Sys] ADD CONSTRAINT [GrDPSys_D_AccessedDomID] 
    FOREIGN KEY ([AccessedDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomCrPerm_PostCr_Sys] ADD CONSTRAINT [GrDCrPPoCrSys_R_AccessorResID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomCrPerm_PostCr_Sys] ADD CONSTRAINT [GrDCrPPoCrSys_R_GrantorResID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm_Sys] ADD CONSTRAINT [GrRPSys_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm_Sys] ADD CONSTRAINT [GrRPSys_R_AccessedResourceID] 
    FOREIGN KEY ([AccessedResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm_Sys] ADD CONSTRAINT [GrRPSys_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResPerm_Sys] ADD CONSTRAINT [GrRPSys_RC_ResourceClassID] 
    FOREIGN KEY ([ResourceClassID]) REFERENCES [OACC].[OAC_ResourceClass] ([ResourceClassID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ADD CONSTRAINT [GrRCrPPoCrSys_R_AccessorResID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ADD CONSTRAINT [GrRCrPPoCrSys_R_GrantorResID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ADD CONSTRAINT [GrRCrPPoCrSys_RC_ResClassID] 
    FOREIGN KEY ([ResourceClassID]) REFERENCES [OACC].[OAC_ResourceClass] ([ResourceClassID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_PostCr_Sys] ADD CONSTRAINT [GrRCrPPoCrSys_D_AccessedDomID] 
    FOREIGN KEY ([AccessedDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm] ADD CONSTRAINT [GrGbRP_RCP_ResClassID] 
    FOREIGN KEY ([ResourceClassID], [PermissionID]) REFERENCES [OACC].[OAC_ResourceClassPermission] ([ResourceClassID],[PermissionID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm] ADD CONSTRAINT [GrGbRP_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm] ADD CONSTRAINT [GrGbRP_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm] ADD CONSTRAINT [GrGbRP_D_AccessedDomainID] 
    FOREIGN KEY ([AccessedDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm_Sys] ADD CONSTRAINT [GrGbRPSys_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm_Sys] ADD CONSTRAINT [GrGbRPSys_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm_Sys] ADD CONSTRAINT [GrGbRPSys_D_AccessedDomID] 
    FOREIGN KEY ([AccessedDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_Global_ResPerm_Sys] ADD CONSTRAINT [GrGbRPSys_RC_ResClassID] 
    FOREIGN KEY ([ResourceClassID]) REFERENCES [OACC].[OAC_ResourceClass] ([ResourceClassID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_Sys] ADD CONSTRAINT [GrRCrPSys_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_Sys] ADD CONSTRAINT [GrRCrPSys_D_AccessedDomainID] 
    FOREIGN KEY ([AccessedDomainID]) REFERENCES [OACC].[OAC_Domain] ([DomainID])
GO


ALTER TABLE [OACC].[OAC_Grant_ResCrPerm_Sys] ADD CONSTRAINT [GrRCrPSys_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomCrPerm_Sys] ADD CONSTRAINT [GrDCrPSys_R_AccessorResourceID] 
    FOREIGN KEY ([AccessorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_Grant_DomCrPerm_Sys] ADD CONSTRAINT [GrDCrPSys_R_GrantorResourceID] 
    FOREIGN KEY ([GrantorResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_ResourcePassword] ADD CONSTRAINT [RP_R_ResourceID] 
    FOREIGN KEY ([ResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO


ALTER TABLE [OACC].[OAC_ResourceExternalID] ADD CONSTRAINT [RE_R_ResourceID] 
    FOREIGN KEY ([ResourceID]) REFERENCES [OACC].[OAC_Resource] ([ResourceID])
GO

