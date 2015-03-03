--
-- Query 1.
--
select JSON_VALUE(PO_DOCUMENT,'$.CostCenter') COST_CENTER, count(*)
  from J_PURCHASEORDER
 group by JSON_VALUE(PO_DOCUMENT,'$.CostCenter')
/
--
-- Query 2.
--
select JSON_VALUE(PO_DOCUMENT,'$.LineItems[0].Part.UPCCode') UPCCODE
  from J_PURCHASEORDER p
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/
--
-- Query 3.
--
select JSON_VALUE(PO_DOCUMENT,'$.LineItems[0].Part.UnitPrice' returning NUMBER(5,3)) UNIT_PRICE
  from J_PURCHASEORDER p
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/
--
-- Query 4.
--
select JSON_VALUE(PO_DOCUMENT,'$.ShippingInstruction.Address') ADDRESS
  from J_PURCHASEORDER
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/
--
-- Query 5.
--
select JSON_VALUE(PO_DOCUMENT,'$.ShippingInstruction.Address' DEFAULT 'N/A' ON ERROR) ADDRESS
  from J_PURCHASEORDER
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/
--
-- Query 6.
--
select JSON_VALUE(PO_DOCUMENT,'$.ShippingInstruction.Address' ERROR ON ERROR) ADDRESS
  from J_PURCHASEORDER
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/
--
-- Query 7.
--
select JSON_VALUE(PO_DOCUMENT,'$.ShippingInstructions.Address' ERROR ON ERROR) ADDRESS
  from J_PURCHASEORDER
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/
--
-- Query 8.
--
select JSON_VALUE(PO_DOCUMENT,'.ShippingInstructions,Address' NULL ON ERROR) ADDRESS
  from J_PURCHASEORDER
 where JSON_VALUE(PO_DOCUMENT,'$.PONumber' returning NUMBER(10)) = 1600
/