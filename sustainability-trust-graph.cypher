CREATE (customs:Entity { name: "Customs", did: "customs.gov.x"})
CREATE (exporter:Entity { name: "Exporter", did: "abcd"})
CREATE (aeo:VerifiableCredential:AEOCert { id: "778"})
CREATE (aeo)-[vc1a:ISSUER]->(customs)
CREATE (aeo)-[vc1b:SUBJECT]->(exporter)

CREATE (deptOfAgri:Entity { name: "Department of Agriculture", did: "agri.gov.x"})
CREATE (inspector:Entity { name: "Inspector", did: "efgh"})
CREATE (agriAuth:VerifiableCredential:AgriAuthorization { id: "445"})
CREATE (agriAuth)-[vc2a:ISSUER]->(deptOfAgri)
CREATE (agriAuth)-[vc2b:SUBJECT]->(inspector)

CREATE (deptOfTrade:Entity { name: "Department of Trade", did: "trade.gov.x"})
CREATE (chamber:Entity { name: "Chamber", did: "8765"})
CREATE (tradeAuth:VerifiableCredential:TradeAuthorization { id: "982"})
CREATE (tradeAuth)-[vc3a:ISSUER]->(deptOfTrade)
CREATE (tradeAuth)-[vc3b:SUBJECT]->(chamber)

CREATE (accrAuth:Entity { name: "Accreditation Authority", did: "accredit.org"})
CREATE (certifier:Entity { name: "Cerifier", did: "5432"})
CREATE (acc:VerifiableCredential:Accreditation { id: "248"})
CREATE (acc)-[vc4a:ISSUER]->(accrAuth)
CREATE (acc)-[vc4b:SUBJECT]->(certifier)

CREATE (trademarks:Entity { name: "Trademarks Office", did: "ip.gov.x"})
CREATE (producer:Entity { name: "Manufacturer", did: "did:web:chocolade-manufacturing-inc.example.com"})
CREATE (tm:VerifiableCredential:Trademark { id: "923"})
CREATE (tm)-[vc5a:ISSUER]->(trademarks)
CREATE (tm)-[vc5b:SUBJECT]->(producer)

CREATE (forwarder:Entity { name: "Forwarder", did: "logistics.com"})
CREATE (consignment:Thing { name: "Consignment", did: "kjh654"})
CREATE (awb:VerifiableCredential:AirWaybill { id: "8876"})
CREATE (awb)-[vc6a:ISSUER]->(forwarder)
CREATE (awb)-[vc6b:SUBJECT]->(consignment)

CREATE (shipment:Thing { name: "Shipment", did: "xyz321"})
CREATE (pl:VerifiableCredential:PackingList { id: "3344"})
CREATE (pl)-[vc7a:ISSUER]->(exporter)
CREATE (pl)-[vc7b:SUBJECT]->(shipment)

CREATE (inv:VerifiableCredential:Invoice { id: "1122"})
CREATE (inv)-[vc8a:ISSUER]->(exporter)
CREATE (inv)-[vc8b:SUBJECT]->(shipment)

CREATE (origin:VerifiableCredential:OriginCertificate { id: "665"})
CREATE (origin)-[vc9a:ISSUER]->(chamber)
CREATE (origin)-[vc9b:SUBJECT]->(shipment)

CREATE (iso:VerifiableCredential:ISO14001 { id: "888"})
CREATE (iso)-[vc10a:ISSUER]->(certifier)
CREATE (iso)-[vc10b:SUBJECT]->(producer)

CREATE (product:Thing { name: "Product", did: "123456"})
CREATE (carbon:VerifiableCredential:CarbonFootprint { id: "22113"})
CREATE (carbon)-[vc11a:ISSUER]->(certifier)
CREATE (carbon)-[vc11b:SUBJECT]->(product)

CREATE (msds:VerifiableCredential:MSDS { id: "3456"})
CREATE (msds)-[vc12a:ISSUER]->(producer)
CREATE (msds)-[vc12b:SUBJECT]->(product)

CREATE (tradeItem:Thing { name: "Trade Item", did: "fgh987"})
CREATE (auth:VerifiableCredential:Authenticity { id: "77665"})
CREATE (auth)-[vc13a:ISSUER]->(producer)
CREATE (auth)-[vc13b:SUBJECT]->(tradeItem)

CREATE (phyto:VerifiableCredential:PhytosanitaryCertificate { id: "2234"})
CREATE (phyto)-[vc14a:ISSUER]->(inspector)
CREATE (phyto)-[vc14b:SUBJECT]->(shipment)

CREATE (consignment)-[ref1:TRANSPORTS]->(shipment)
CREATE (shipment)-[ref2:CONTAINS]->(tradeItem)
CREATE (tradeItem)-[ref3:REFERENCES]->(product)

CREATE (rainforestAlliance:Entity:TrustAnchor { name: "Rainforest Alliance", did: "did:web:ghana.rainforest-alliance.example.com"})
CREATE (farm:Entity { name: "Ghana Cocoa Coop", did: "did:web:ghana-cocoa-coop.example.com"})
CREATE (farmCred:VerifiableCredential:RainforestAllianceFarmCertificate { 
            type: "RainforestAllianceFarmCertificate",
            deforestation: true,
            biodiversity: true,
            regenerativeAggriculture: true,
            indigenousCommunities: true,
            genderEquality: true,
            childLabor: true,
            livingWage: true,
            livingIncome: true
})
CREATE (farmCred)-[vc15a:ISSUER]->(rainforestAlliance)
CREATE (farmCred)-[vc15b:`https://vocabulary.uncefact.org/sustainability/sustainable_harvesting`]->(farm)
CREATE (farmCred)-[vc15c:`https://vocabulary.uncefact.org/sustainability/Biodiversity`]->(farm)
CREATE (farmCred)-[vc15d:`https://vocabulary.uncefact.org/sustainability/regeneration_of_tree_cover_after_logging_e_g_to_pre_harvesting_situation`]->(farm)
CREATE (farmCred)-[vc15e:`https://vocabulary.uncefact.org/sustainability/activities_not_adversely_affecting_local_communities_access_to_livelihoods`]->(farm)
CREATE (farmCred)-[vc15f:`https://vocabulary.uncefact.org/sustainability/gender_policies_and_best_practices`]->(farm)
CREATE (farmCred)-[vc15g:`https://vocabulary.uncefact.org/sustainability/child_labour_legal_compliance_policy`]->(farm)
CREATE (farmCred)-[vc15h:`https://vocabulary.uncefact.org/sustainability/fair_and_timely_payment_of_wages`]->(farm)
CREATE (farmCred)-[vc15i:`https://vocabulary.uncefact.org/sustainability/living_wage_based_on_sector_or_region_specificitie`]->(farm)

CREATE (fairtrade:Entity:TrustAnchor { name: "Fairtrade", did: "did:web:ghana.fairtrade.example.com"})
CREATE (scCred:VerifiableCredential:FairtradeCertificate { 
            type: "FairtradeCertificate",
            deforestation: true,
            biodiversity: true,
            indigenousCommunities: true,
            genderEquality: true,
            workerRights: true,
            livingWage: true,
            livingIncome: true
})
CREATE (scCred)-[vc16a:ISSUER]->(fairtrade)
CREATE (scCred)-[vc16b:`https://vocabulary.uncefact.org/sustainability/sustainable_harvesting`]->(producer)
CREATE (scCred)-[vc16c:`https://vocabulary.uncefact.org/sustainability/Biodiversity`]->(producer)
CREATE (scCred)-[vc16d:`https://vocabulary.uncefact.org/sustainability/activities_not_adversely_affecting_local_communities_access_to_livelihoods`]->(producer)
CREATE (scCred)-[vc16e:`https://vocabulary.uncefact.org/sustainability/gender_policies_and_best_practices`]->(producer)
CREATE (scCred)-[vc16f:`https://vocabulary.uncefact.org/sustainability/existence_of_publicly_available_policy_defining_workers_rights`]->(producer)
CREATE (scCred)-[vc16g:`https://vocabulary.uncefact.org/sustainability/fair_and_timely_payment_of_wages`]->(producer)
CREATE (scCred)-[vc16h:`https://vocabulary.uncefact.org/sustainability/living_wage_based_on_sector_or_region_specificitie`]->(producer)

CREATE (inv2:VerifiableCredential:Invoice { id: "inv123456" })
CREATE (inv2)-[vc17a:ISSUER]->(farm)
CREATE (inv2)-[vc17b:SUBJECT]->(producer)
