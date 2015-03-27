<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="ScoreServer" generation="1" functional="0" release="0" Id="b849ee5b-3cb3-4a91-90e7-44947e0931b1" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="ScoreServerGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="ScoreServiceRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/ScoreServer/ScoreServerGroup/LB:ScoreServiceRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="ScoreServiceRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ScoreServer/ScoreServerGroup/MapScoreServiceRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="ScoreServiceRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ScoreServer/ScoreServerGroup/MapScoreServiceRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:ScoreServiceRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapScoreServiceRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapScoreServiceRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="ScoreServiceRole" generation="1" functional="0" release="0" software="D:\ZAch\web\Azure\ScoresServer\ScoreServer\csx\Debug\roles\ScoreServiceRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;ScoreServiceRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;ScoreServiceRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="ScoreServiceRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="ScoreServiceRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="ScoreServiceRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="1e12a4ab-d1be-43a4-a09f-b6d9621cce62" ref="Microsoft.RedDog.Contract\ServiceContract\ScoreServerContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="2e8e4a78-422f-416d-9149-ba1ee3132bfb" ref="Microsoft.RedDog.Contract\Interface\ScoreServiceRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/ScoreServer/ScoreServerGroup/ScoreServiceRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>