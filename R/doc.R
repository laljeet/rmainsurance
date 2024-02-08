#' Insurance Data
#'
#' A dataset containing detailed insurance and cause of Loss.
#'
#' @format Format column specifies the maximum length and data type for each of the elements.
#' A format of 9 indicates that the value can only be numeric, while a format of X can be alpha-numeric values.
#'  Decimal formats will include a V with the number of places to the left of the decimal specified to the left of the V,
#'  while the decimal precision is specified to the right of the V (e.g. 9(08)V9(02) would be 00000000.00).
#'  An S as the first character in the specification of format, indicates that the value in that element can contain negatives when applicable.
#'  A list of data frames with \code{n} rows and the following 30 columns for each year:
#' \describe{
#'   \item{\code{Commodity Year Identifier}}{9(04). The identifier that represents the year in which the crop/commodity is normally harvested and indicates the policy year for which coverage was provided.}
#'   \item{\code{State Code}}{9(02). The FIPS code that denotes the State in which the insured farm is located.}
#'   \item{\code{State Abbreviation}}{X(02). USPS state abbreviation.}
#'   \item{\code{County Code}}{9(03). The FIPS code that denotes the County in which the insured farm is located.}
#'   \item{\code{County Name}}{X(30). Name of the county.}
#'   \item{\code{Commodity Code}}{9(04). The Risk Management Agency (RMA) code that denotes the crop/commodity for which the policy is issued.}
#'   \item{\code{Commodity Name}}{X(30). Name of the crop/commodity.}
#'   \item{\code{Insurance Plan Code}}{9(02). Code that denotes the type of insurance coverage is selected for the insured crop (e.g., APH, Revenue, Dollar, etc.).}
#'   \item{\code{Insurance Plan Name Abbreviation}}{X(05). Abbreviation of the Insurance Plan Name.}
#'   \item{\code{Coverage Category}}{X(01). Code that identifies the category of coverage elected: A = Buyup; C = CAT; E = Existing Coverage Policy; L = Limited Coverage.}
#'   \item{\code{Stage Code}}{X(02). See Stage Code Listing.}
#'   \item{\code{Cause of Loss Code}}{9(02). The RMA code that identifies the peril that caused the loss on the crop.}
#'   \item{\code{Cause of Loss Description}}{X(35). Description of the cause of loss.}
#'   \item{\code{Month of Loss}}{9(02). Month when the loss occurred.}
#'   \item{\code{Month of Loss Name}}{X(03). Name of the month when the loss occurred.}
#'   \item{\code{Year of Loss}}{9(04). Year the loss occurred.}
#'   \item{\code{Policies Earning Premium}}{9(09). Count of the number of crop policies with premium. Note: Not available for years prior to 1989.}
#'   \item{\code{Policies Indemnified}}{9(09). Count of the number of crop policies with a reported loss.}
#'   \item{\code{Net Planted Quantity}}{9(12)V9(02). Number of acres, tons, pounds, etc., planted to the crop after the insured’s share is applied.}
#'   \item{\code{Net Endorsed Acres}}{9(12)V9(02). Number of acres insured under an endorsement (e.g., SCO, STAX, Margin Protection).}
#'   \item{\code{Liability}}{9(12). The maximum dollar amount of insurance for the crop.}
#'   \item{\code{Total Premium}}{9(12). Premium before application of any subsidies. In general, the base premium rates times liability (Also called the base premium).}
#'   \item{\code{Producer Paid Premium}}{9(12). Premium paid by the producer.}
#'   \item{\code{Subsidy}}{9(12). Amount of subsidized premium.}
#'   \item{\code{State/Private Subsidy}}{9(12). Subsidy provided by a state or private entity.}
#'   \item{\code{Additional Subsidy}}{9(12). An additional subsidy from a program or other process. 2021 and 2022 Additional Subsidy represents Pandemic Cover Crop Program amount.}
#'   \item{\code{EFA Premium Discount}}{9(12). EFA Premium Discount.}
#'   \item{\code{Net Determined Quantity}}{9(12)V9(02). Number of acres, tons, pounds, etc., loss due to damage after the insured’s share is applied.}
#'   \item{\code{Indemnity Amount}}{S9(12). The total amount of the loss for the designated peril.}
#'   \item{\code{Loss Ratio}}{9(5)V9(02). Calculated: Indemnity / Total Premium.}
#' }
#' @details This dataset provides comprehensive coverage of insurance data related to various commodities, including details about policies, coverage, losses, and premiums. It is designed for analysis of insurance trends, policy decisions, and risk assessment in the agricultural sector.
#' @source Summarized participation information broken down by the causes of loss.- https://www.rma.usda.gov/SummaryOfBusiness/CauseOfLoss
"Insurance_data"
