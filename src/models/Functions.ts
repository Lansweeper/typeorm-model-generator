/**
 * Copyright (C) 2018 Lansweeper, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Created by jamespitts on 10/2/18.
 */

import { FunctionType } from "./FunctionType";

export class Functions {
    public static SUM: FunctionType = {
        typeCode: 1,
        name: "SUM",
        description: "calculates the sum of values."
    };

    public static AVG: FunctionType = {
        typeCode: 2,
        name: "AVG",
        description: "calculates the average of a set of values."
    };

    public static MIN: FunctionType = {
        typeCode: 3,
        name: "MIN",
        description: "gets the minimum value in a set of values."
    };

    public static MAX: FunctionType = {
        typeCode: 4,
        name: "MAX",
        description: "gets the maximum value in a set of values."
    };

    public static COUNT: FunctionType = {
        typeCode: 5,
        name: "COUNT",
        description: "counts number records in a set or group of values."
    };

    public static DATEPART: FunctionType = {
        typeCode: 6,
        name: "DATEPART",
        description: "get subpart of date, such as month, week, hour, etc."
    };

    public static SUBSTRING: FunctionType = {
        typeCode: 7,
        name: "SUBSTRING",
        description: "extract part of string."
    };
}

export function getAggregates(): FunctionType[] {
    const rtn: FunctionType[] = [];
    Object.keys(Functions).forEach((name: string) => {
        rtn.push(Functions[name]);
    });

    return rtn;
}

export function getNumberFunctions(): FunctionType[] {
    return [
        Functions.SUM,
        Functions.AVG,
        Functions.MIN,
        Functions.MAX,
        Functions.COUNT
    ];
}

export function getStringFunctions(): FunctionType[] {
    return [Functions.SUBSTRING, Functions.COUNT];
}

export function getDateFunctions(): FunctionType[] {
    return [Functions.DATEPART, Functions.COUNT];
}
